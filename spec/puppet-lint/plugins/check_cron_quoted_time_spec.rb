require 'spec_helper'

describe 'unquoted_cron_time' do
  let(:msg) { 'unquoted cron time' }

  context 'with fix disabled' do
    context 'unquoted cron hour' do
      let(:code) { "cron { 'foo': hour => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(23)
      end
    end

    context 'quoted cron hour' do
      let(:code) { "cron { 'foo': hour => '05' }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted cron minute' do
      let(:code) { "cron { 'foo': minute => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(25)
      end
    end

    context 'quoted cron minute' do
      let(:code) { "cron { 'foo': minute => '05' }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted cron month' do
      let(:code) { "cron { 'foo': month => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(24)
      end
    end

    context 'quoted cron month' do
      let(:code) { "cron { 'foo': month => '05' }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted cron monthday' do
      let(:code) { "cron { 'foo': monthday => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(27)
      end
    end

    context 'quoted cron monthday' do
      let(:code) { "cron { 'foo': monthday => '05' }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted cron weekday' do
      let(:code) { "cron { 'foo': weekday => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(26)
      end
    end

    context 'quoted cron weekday' do
      let(:code) { "cron { 'foo': weekday => '05' }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
 
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'unquoted cron hour w/fix' do
      let(:code) { "cron { 'foo': hour => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the manifest' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(23)
      end

      it 'should single quote the cron hour' do
        expect(manifest).to eq("cron { 'foo': hour => '05' }")
      end
    end

    context 'unquoted cron minute w/fix' do
      let(:code) { "cron { 'foo': minute => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the manifest' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(25)
      end

      it 'should single quote the cron minute' do
        expect(manifest).to eq("cron { 'foo': minute => '05' }")
      end
    end

    context 'unquoted cron month w/fix' do
      let(:code) { "cron { 'foo': month => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the manifest' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(24)
      end

      it 'should single quote the cron month' do
        expect(manifest).to eq("cron { 'foo': month => '05' }")
      end
    end

    context 'unquoted cron monthday w/fix' do
      let(:code) { "cron { 'foo': monthday => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the manifest' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(27)
      end

      it 'should single quote the cron monthday' do
        expect(manifest).to eq("cron { 'foo': monthday => '05' }")
      end
    end

    context 'unquoted cron weekday w/fix' do
      let(:code) { "cron { 'foo': weekday => 05 }" }

      it 'should only detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the manifest' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(26)
      end

      it 'should single quote the cron weekday' do
        expect(manifest).to eq("cron { 'foo': weekday => '05' }")
      end
    end
  end

end
