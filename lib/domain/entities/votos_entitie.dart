class Votos {
    final int likes;
    final int dislikes;

    Votos({
        required this.likes,
        required this.dislikes,
    });

    factory Votos.fromJson(Map<String, dynamic> json) => Votos(
        likes: json["likes"] ?? '',
        dislikes: json["dislikes"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "likes": likes,
        "dislikes": dislikes,
    };
}