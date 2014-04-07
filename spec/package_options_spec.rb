require 'spec_helper'

describe "package options" do

  subject { KnitrRuby::Knittr.new(:package_options => package_options) }
  let(:input) { "```{r}\n3*3\n```" }

end