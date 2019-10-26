# frozen_string_literal: true

RSpec.describe AttrFilters do
  context "filters not added" do
    it "should do nothing" do
      form_class = Struct.new(:user_name) do
        include AttrFilters
      end
      form = form_class.new("Mike Dou")

      form.filter!

      expect(form.user_name).to eq("Mike Dou")
    end
  end

  context "trim filter" do
    it "should call trim filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, trim: true
      end
      form = form_class.new("  Mike Dou  ")

      expect(AttrFilters::Filters::LIST[:trim]).to receive(:call).with("  Mike Dou  ")

      form.filter!
    end
  end

  context "capitalize filter" do
    it "should call capitalize filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, capitalize: true
      end
      form = form_class.new("mike dou")

      expect(AttrFilters::Filters::LIST[:capitalize]).to receive(:call).with("mike dou")

      form.filter!
    end
  end

  context "squeeze filter" do
    it "should call squeeze filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, squeeze: true
      end
      form = form_class.new("Mike  Dou")

      expect(AttrFilters::Filters::LIST[:squeeze]).to receive(:call).with("Mike  Dou")

      form.filter!
    end
  end

  context "letters_only filter" do
    it "should call letters_only filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, letters_only: true
      end
      form = form_class.new("Mike 123 Dou")

      expect(AttrFilters::Filters::LIST[:letters_only]).to receive(:call).with("Mike 123 Dou")

      form.filter!
    end
  end

  context "numbers_only filter" do
    it "should call numbers_only filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, numbers_only: true
      end
      form = form_class.new("Mike 123 Dou")

      expect(AttrFilters::Filters::LIST[:numbers_only]).to receive(:call).with("Mike 123 Dou")

      form.filter!
    end
  end

  context "upcase filter" do
    it "should call upcase filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, upcase: true
      end
      form = form_class.new("Mike Dou")

      expect(AttrFilters::Filters::LIST[:upcase]).to receive(:call).with("Mike Dou")

      form.filter!
    end
  end

  context "downcase filter" do
    it "should call downcase filter" do
      form_class = Struct.new(:user_name) do
        include AttrFilters

        filters :user_name, downcase: true
      end
      form = form_class.new("Mike Dou")

      expect(AttrFilters::Filters::LIST[:downcase]).to receive(:call).with("Mike Dou")

      form.filter!
    end
  end

  context "when filter or attribute doen't exist" do
    it "should raise an error if attribute doesn't exist" do
      form_class = Struct.new(:user_name) do
        include AttrFilters
      end

      expect {
        form_class.class_eval { filters :unknown_attr, trim: true }
      }.to raise_error(AttrFilters::UnknownAttributeError)
    end

    it "should raise an error if filter doesn't exist" do
      form_class = Struct.new(:user_name) do
        include AttrFilters
      end

      expect {
        form_class.class_eval { filters :user_name, unknown_filter: true }
      }.to raise_error(AttrFilters::UnknownFilterError)
    end
  end
end
