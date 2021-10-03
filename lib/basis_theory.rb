# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'basis_theory/version'

module BasisTheory
  autoload :Client, 'basis_theory/client'
  autoload :Collection, 'basis_theory/collection'
  autoload :Error, 'basis_theory/error'
  autoload :Resource, 'basis_theory/resource'
  autoload :Object, 'basis_theory/object'

  autoload :ApplicationResource, 'basis_theory/resources/application_resource'
  autoload :AtomicBankResource, 'basis_theory/resources/atomic_bank_resource'
  autoload :TokenResource, 'basis_theory/resources/token_resource'

  autoload :Application, 'basis_theory/objects/application'
  autoload :AtomicBank, 'basis_theory/objects/atomic_bank'
  autoload :Token, 'basis_theory/objects/token'
end
