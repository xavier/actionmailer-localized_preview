require 'spec_helper'

class TestPreview < ActionMailer::Preview

  include ActionMailer::LocalizedPreview

  def mailer1
    "mailer1_message_with_locale_#{I18n.locale}"
  end

  def mailer2(locale)
    "mailer2_message_with_locale_#{locale}"
  end

  def mailer3(foo, bar)
    "will raise an error"
  end

end

describe ActionMailer::LocalizedPreview do

  before do
    I18n.available_locales = [:en, :fr, :nl]
  end

  describe ".emails" do

    it "returns localized method names" do
      expected = %w{mailer1_en mailer1_fr mailer1_nl mailer2_en mailer2_fr mailer2_nl mailer3_en mailer3_fr mailer3_nl}
      expect(TestPreview.emails).to eq(expected)
    end

  end

  describe ".call" do

    context "when calling a mailer with no arguments" do

      it "calls the method with the correct locale set" do
        expect(TestPreview.call("mailer1_en")).to eq("mailer1_message_with_locale_en")
      end

      it "does not affect the current locale" do
        expect { TestPreview.call("mailer1_en") }.not_to change(I18n, :locale)
      end

    end

    context "when calling a mailer which accepts one argument" do

      it "passes the locale as argument to the method" do
        expect(TestPreview.call("mailer2_fr")).to eq("mailer2_message_with_locale_fr")
      end

      it "does not affect the current locale" do
        expect { TestPreview.call("mailer2_fr") }.not_to change(I18n, :locale)
      end

    end

    context "when calling a mailer which accepts more than one argument" do

      it "raises an error" do
        expect { TestPreview.call("mailer3_fr") }.to raise_error(ArgumentError)
      end

      it "does not affect the current locale" do
        expect do
          TestPreview.call("mailer3_fr") rescue ArgumentError
        end.not_to change(I18n, :locale)
      end

    end

  end

end