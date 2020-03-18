class SongDetailModel {
  final String artistName;
  final String id;
  final String releaseDate;
  final String name;
  final String kind;
  final String copyright;
  final String artistId;
  final String artistUrl;
  final String artworkUrl100;
  final String url;
  final List genres;

  SongDetailModel(
      this.artistName,
      this.id,
      this.releaseDate,
      this.name,
      this.kind,
      this.copyright,
      this.artistId,
      this.artistUrl,
      this.artworkUrl100,
      this.url,
      this.genres) {}
}
