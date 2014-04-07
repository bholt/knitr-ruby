require 'spec_helper'

describe "knitting" do
  subject { KnitrRuby::Knitr.new }

  describe "code chunk" do
    let(:input) { "```{r}\n3*3\n```" }
    let(:output) { "\n```r\n3 * 3\n```\n\n```\n## [1] 9\n```\n\n" }

    it "should knit" do
      subject.knit(input).should eq(output)
    end
  end

  describe "Ruby code chunk" do
    let(:input) { "\n```{r engine='ruby'}\nputs 3*3\n```" }
    let(:output) { "\n\n```ruby\nputs 3*3\n```\n\n```\n## 9\n```\n\n" }

    it "should knit" do
      subject.knit(input).should eq(output)
    end
  end

  describe "inline code" do
    let(:input) { "bla bla should be `r 3*3` years old" }
    let(:output) { "bla bla should be 9 years old\n" }

    it "should knit" do
      subject.knit(input).should eq(output)
    end
  end
end