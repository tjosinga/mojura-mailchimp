require 'json'
require 'rest-client'

module MojuraAPI

	class MailChimpResource < RestResource

		attr_reader :cached_listids, :cached_atk

		def name
			'MailChimp resource.'
		end

		def description
			'A resource which post subscribers to a MailChimp list.'
		end

		def get_from_mailchimp(api_url, method = :get, payload = nil)
			api_key = Settings.get_s(:api_key, :mailchimp, '')
			data_center = api_key.scan(/\-(\w+)$/)[0][0]
			url = "https://#{data_center}.api.mailchimp.com/3.0/" + api_url

			headers = { Authorization: "apikey #{api_key}" }

			begin
				response = RestClient::Request.execute({
				 url: url,
				 method: method,
				 headers: headers,
				 payload: payload
				})
			rescue => e
				raise e if e.response.nil?
				response = e.response
			end

			data = JSON.parse(response)
			data.symbolize_keys!
			return data
		end

		def post(params)
			request_json = {
				email_address: params[:email],
				status: 'pending',
			  merge_fields: {
				  FNAME: params[:firstname],
			    LNAME: params[:lastname]
			  }
			}
			api_url = "lists/#{params[:listid]}/members"
			return get_from_mailchimp(api_url, :post, request_json)
		end

		def post_conditions
			result = {
				description: 'Adds an email address as a subscriber to MailChimp.',
				attributes: {
					listid: {required: true, type: String, description: 'The id of a MailChimp list.'},
					email: {required: true, type: String, description: 'The email address.'},
					firstname: {required: true, type: String, description: 'The first name.'},
					lastname: {required: true, type: String, description: 'The last name.'},
				}
			}
			return result
		end

		def all(params)
			now = Time.now.to_i
			result = []
			if (@cached_listids.nil? || (now - @cached_at.to_i > 300))
				data = get_from_mailchimp('lists')
				data[:lists].each { | list_data |
					result.push({id: list_data[:id], name: list_data[:name]})
				}
				@cached_listids = result
				@cached_at = Time.now.to_i
				return result
			else
				result = @cached_listids
			end
			return result;
		end

		def all_conditions
			{
				description: 'Returns an array of MailChimp Lists.',
			}
		end

	end

	API.register_resource(MailChimpResource.new('mailchimp', ''))

end