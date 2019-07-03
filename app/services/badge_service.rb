# frozen_string_literal: true

class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless test_passage_passed?

    Badge.all.select { |badge| send(badge.award_rule, badge.badge_param) }
  end

  private

  def first_try_complete?(_param)
    return unless test_passage_passed?

    user_passages.count == 1
  end

  def whole_category_complete?(category)
    return unless test_passage_passed?
    return unless @test.category.title == category
    return if has_this_badge?
    #return if @user.badges.any?{ |b| b.badge_param == category }

    test_ids = Test.by_category(category).ids
    test_ids.size == user_success_tests(test_ids)
  end

  def all_by_level?(level)
    return unless test_passage_passed?
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

  def test_passage_passed?
    @test_passage.passed?
  end

  def has_this_badge?
    @user.badges.any? { |badge| Badge.all.include?(badge) }
  end


end
