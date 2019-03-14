# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless @test_passage.passed?

    Badge.all.select { |badge| send(badge.award_rule, badge.badge_param) }
  end

  private

  def first_try_complete?(_param)
    user_passages.count == 1
  end

  def whole_category_complete?(category)
    return unless @test.category.title == category

    test_ids = Test.by_category(category).ids
    test_ids.size == user_success_tests(test_ids)
  end

  def all_by_level?(level)
    return unless @test.level == level

    test_ids = Test.by_level(level).ids
    test_ids.size == user_success_tests(test_ids)
  end

  def user_passages
    @user.test_passages.where(test: @test)
  end

  def user_success_tests(test_ids)
    @user.test_passages.where(test_id: test_ids).success
         .pluck(:test_id).uniq.count # .uniq { |test_passage| test_passage.test_id }.count
  end
end
