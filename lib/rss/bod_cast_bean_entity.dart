class BodCastBean {
	BodCastBeanFeed feed;

	BodCastBean({this.feed});

	BodCastBean.fromJson(Map<String, dynamic> json) {
		feed = json['feed'] != null ? new BodCastBeanFeed.fromJson(json['feed']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
		return data;
	}
}

class BodCastBeanFeed {
	String country;
	String copyright;
	BodCastBeanFeedAuthor author;
	String icon;
	List<BodCastBeanFeedLink> link;
	String id;
	String title;
	String updated;
	List<BodCastBeanFeedResult> result;

	BodCastBeanFeed({this.country, this.copyright, this.author, this.icon, this.link, this.id, this.title, this.updated, this.result});

	BodCastBeanFeed.fromJson(Map<String, dynamic> json) {
		country = json['country'];
		copyright = json['copyright'];
		author = json['author'] != null ? new BodCastBeanFeedAuthor.fromJson(json['author']) : null;
		icon = json['icon'];
		if (json['links'] != null) {
			link = new List<BodCastBeanFeedLink>();
			json['links'].forEach((v) { link.add(new BodCastBeanFeedLink.fromJson(v)); });
		}
		id = json['id'];
		title = json['title'];
		updated = json['updated'];
		if (json['results'] != null) {
			result = new List<BodCastBeanFeedResult>();
			json['results'].forEach((v) { result.add(new BodCastBeanFeedResult.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['country'] = this.country;
		data['copyright'] = this.copyright;
		if (this.author != null) {
      data['author'] = this.author.toJson();
    }
		data['icon'] = this.icon;
		if (this.link != null) {
      data['links'] = this.link.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		data['title'] = this.title;
		data['updated'] = this.updated;
		if (this.result != null) {
      data['results'] = this.result.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class BodCastBeanFeedAuthor {
	String name;
	String urus;

	BodCastBeanFeedAuthor({this.name, this.urus});

	BodCastBeanFeedAuthor.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		urus = json['uri'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['uri'] = this.urus;
		return data;
	}
}

class BodCastBeanFeedLink {
	String self;
	String alternate;

	BodCastBeanFeedLink({this.self, this.alternate});

	BodCastBeanFeedLink.fromJson(Map<String, dynamic> json) {
		self = json['self'];
		alternate = json['alternate'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['self'] = this.self;
		data['alternate'] = this.alternate;
		return data;
	}
}

class BodCastBeanFeedResult {
	String artworkurl100;
	String copyright;
	String contentadvisoryrating;
	String releasedate;
	String kind;
	String artisturl;
	List<BodCastBeanFeedResultGenre> genre;
	String name;
	String artistname;
	String artistid;
	String id;
	String url;

	BodCastBeanFeedResult({this.artworkurl100, this.copyright, this.contentadvisoryrating, this.releasedate, this.kind, this.artisturl, this.genre, this.name, this.artistname, this.artistid, this.id, this.url});

	BodCastBeanFeedResult.fromJson(Map<String, dynamic> json) {
		artworkurl100 = json['artworkUrl100'];
		copyright = json['copyright'];
		contentadvisoryrating = json['contentAdvisoryRating'];
		releasedate = json['releaseDate'];
		kind = json['kind'];
		artisturl = json['artistUrl'];
		if (json['genres'] != null) {
			genre = new List<BodCastBeanFeedResultGenre>();
			json['genres'].forEach((v) { genre.add(new BodCastBeanFeedResultGenre.fromJson(v)); });
		}
		name = json['name'];
		artistname = json['artistName'];
		artistid = json['artistId'];
		id = json['id'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['artworkUrl100'] = this.artworkurl100;
		data['copyright'] = this.copyright;
		data['contentAdvisoryRating'] = this.contentadvisoryrating;
		data['releaseDate'] = this.releasedate;
		data['kind'] = this.kind;
		data['artistUrl'] = this.artisturl;
		if (this.genre != null) {
      data['genres'] = this.genre.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['artistName'] = this.artistname;
		data['artistId'] = this.artistid;
		data['id'] = this.id;
		data['url'] = this.url;
		return data;
	}
}

class BodCastBeanFeedResultGenre {
	String genreid;
	String name;
	String url;

	BodCastBeanFeedResultGenre({this.genreid, this.name, this.url});

	BodCastBeanFeedResultGenre.fromJson(Map<String, dynamic> json) {
		genreid = json['genreId'];
		name = json['name'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['genreId'] = this.genreid;
		data['name'] = this.name;
		data['url'] = this.url;
		return data;
	}
}
