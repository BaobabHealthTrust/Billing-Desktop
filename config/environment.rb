# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
#Rails.application.initialize!
Billing::Application.initialize!

require "bantu_soundex"
require "billing_service"
require "bean"
require "csv"

openmrs = YAML.load(File.open(File.join(Rails.root, "config/database.yml"), "r"))['openmrs']
Patient.establish_connection(openmrs)
Person.establish_connection(openmrs)
PersonName.establish_connection(openmrs)
PersonNameCode.establish_connection(openmrs)
PersonAttribute.establish_connection(openmrs)
PersonAddress.establish_connection(openmrs)
PersonAttributeType.establish_connection(openmrs)
PatientIdentifier.establish_connection(openmrs)
PatientIdentifierType.establish_connection(openmrs)
