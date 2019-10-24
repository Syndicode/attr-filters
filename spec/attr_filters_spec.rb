# frozen_string_literal: true

RSpec.describe AttrFilters do
  context "capitalize filter" do
    it "should capitalize spaces" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, capitalize: true
      end

      form = form_class.new(user_name: "mike dou")

      form.filter!

      expect(form.user_name).to eq("Mike dou")
    end
  end

  context "squeeze filter" do
    it "should squeeze spaces" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, squeeze: true
      end

      form = form_class.new(user_name: "Mike   Dou")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end
  end

  context "letters_only filter" do
    it "should remove all not numbers characters" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, letters_only: true
      end

      form = form_class.new(user_name: "Mike 123 Dou")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end
  end

  context "numbers_only filter" do
    it "should remove all not numbers characters" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, numbers_only: true
      end

      form = form_class.new(user_name: "Mike 123 Dou")

      form.filter!

      expect(form.user_name).to eq("123")
    end
  end

  context "upcase filter" do
    it "should upcase value" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, upcase: true
      end

      form = form_class.new(user_name: "Mike Dou")

      form.filter!

      expect(form.user_name).to eq("MIKE DOU")
    end
  end

  context "downcase filter" do
    it "should downcase value" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, downcase: true
      end

      form = form_class.new(user_name: "Mike Dou")

      form.filter!

      expect(form.user_name).to eq("mike dou")
    end
  end

  context "when filter or attribute doen't exist" do
    it "should raise an error if attribute doesn't exist" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters
      end

      expect {
        form_class.class_eval { filters :unknown_attr, trim: true }
      }.to raise_error(AttrFilters::UnknownAttributeError)
    end

    it "should raise an error if filter doesn't exist" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters
      end

      expect {
        form_class.class_eval { filters :user_name, unknown_filter: true }
      }.to raise_error(AttrFilters::UnknownFilterError)
    end

  end

  context "trim filter" do
    it "should trim spaces before" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, trim: true
      end

      form = form_class.new(user_name: "  Mike Dou")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end

    it "should trim spaces after" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, trim: true
      end
      form = form_class.new(user_name: "Mike Dou  ")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end

    it "should trim spaces both" do
      form_class = Struct.new(:user_name, keyword_init: true) do
        include AttrFilters

        filters :user_name, trim: true
      end
      form = form_class.new(user_name: "  Mike Dou  ")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end
  end
end
