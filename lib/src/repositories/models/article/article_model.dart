class ArticleModel {
  int? articleId;
  int? categoryId;
  String? title;
  String? description;
  String? mediaType;
  String? cover;
  String? coverCopyright;
  String? video;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;
  String? published;
  String? commentStatus;
  String? metaTitle;
  String? metaDescription;
  double? rateSum;
  String? rate;
  int? viewed;
  int? liked;
  int? countComment;
  String? countLastupdate;
  String? featured;
  String? homeslider;
  String? approved;
  int? approvedBy;
  String? approvedDate;
  String? reviewed;
  int? reviewedBy;
  String? reviewedDate;
  String? agent;
  String? historyLiked;
  String? slug;
  String? contentShape;
  String? slotAdsId;
  String? categoryTitle;
  int? subCategoryId;
  String? subCategoryTitle;
  Author? author;
  bool? bookmark;
  int? articleAdsId;
  String? permalink;

  /// [Don't Edit] named constructor khusus profile my bookmark
  ArticleModel.profileMyBookmark(this.articleId);

  ArticleModel(
      {this.articleId,
      this.categoryId,
      this.title,
      this.description,
      this.mediaType,
      this.cover,
      this.coverCopyright,
      this.video,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.published,
      this.commentStatus,
      this.metaTitle,
      this.metaDescription,
      this.rateSum,
      this.rate,
      this.viewed,
      this.liked,
      this.countComment,
      this.countLastupdate,
      this.featured,
      this.homeslider,
      this.approved,
      this.approvedBy,
      this.approvedDate,
      this.reviewed,
      this.reviewedBy,
      this.reviewedDate,
      this.agent,
      this.historyLiked,
      this.slug,
      this.contentShape,
      this.slotAdsId,
      this.categoryTitle,
      this.subCategoryId,
      this.subCategoryTitle,
      this.author,
      this.bookmark,
      this.articleAdsId,
      this.permalink});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    mediaType = json['media_type'];
    cover = json['cover'];
    coverCopyright = json['cover_copyright'];
    video = json['video'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    published = json['published'];
    commentStatus = json['comment_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    rateSum = double.parse((json['rate_sum'] ?? 0).toString());
    rate = json['rate'];
    viewed = json['viewed'];
    liked = json['liked'];
    countComment = json['count_comment'];
    countLastupdate = json['count_lastupdate'];
    featured = json['featured'];
    homeslider = json['homeslider'];
    approved = json['approved'];
    approvedBy = json['approved_by'];
    approvedDate = json['approved_date'];
    reviewed = json['reviewed'];
    reviewedBy = json['reviewed_by'];
    reviewedDate = json['reviewed_date'];
    agent = json['agent'];
    historyLiked = json['history_liked'];
    slug = json['slug'];
    contentShape = json['content_shape'];
    slotAdsId = json['slot_ads_id'];
    categoryTitle = json['category_title'];
    subCategoryId = json['sub_category_id'];
    subCategoryTitle = json['sub_category_title'];
    author = json['author'] != null ? new Author.fromJson(json['author']) : null;
    bookmark = json['bookmark'];
    articleAdsId = json['article_ads_id'];
    permalink = json['permalink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['media_type'] = this.mediaType;
    data['cover'] = this.cover;
    data['cover_copyright'] = this.coverCopyright;
    data['video'] = this.video;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['published'] = this.published;
    data['comment_status'] = this.commentStatus;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['rate_sum'] = this.rateSum;
    data['rate'] = this.rate;
    data['viewed'] = this.viewed;
    data['liked'] = this.liked;
    data['count_comment'] = this.countComment;
    data['count_lastupdate'] = this.countLastupdate;
    data['featured'] = this.featured;
    data['homeslider'] = this.homeslider;
    data['approved'] = this.approved;
    data['approved_by'] = this.approvedBy;
    data['approved_date'] = this.approvedDate;
    data['reviewed'] = this.reviewed;
    data['reviewed_by'] = this.reviewedBy;
    data['reviewed_date'] = this.reviewedDate;
    data['agent'] = this.agent;
    data['history_liked'] = this.historyLiked;
    data['slug'] = this.slug;
    data['content_shape'] = this.contentShape;
    data['slot_ads_id'] = this.slotAdsId;
    data['category_title'] = this.categoryTitle;
    data['sub_category_id'] = this.subCategoryId;
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['bookmark'] = this.bookmark;
    data['article_ads_id'] = this.articleAdsId;
    data['permalink'] = this.permalink;
    return data;
  }
}

class Author {
  String? displayName;
  String? avatar;
  String? title;

  Author({this.displayName, this.avatar, this.title});

  Author.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    avatar = json['avatar'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['avatar'] = this.avatar;
    data['title'] = this.title;
    return data;
  }
}
