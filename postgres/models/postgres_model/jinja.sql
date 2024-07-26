-- models/postgres_model/football_players.sql

-- Define the player data
{% set players = [
    {'name': 'Lionel Messi', 'position': 'Forward', 'club': 'Paris Saint-Germain', 'nationality': 'Argentine'},
    {'name': 'Cristiano Ronaldo', 'position': 'Forward', 'club': 'Al Nassr', 'nationality': 'Portuguese'},
    {'name': 'Neymar Jr', 'position': 'Forward', 'club': 'Paris Saint-Germain', 'nationality': 'Brazilian'},
    {'name': 'Kylian Mbappe', 'position': 'Forward', 'club': 'Paris Saint-Germain', 'nationality': 'French'},
    {'name': 'Kevin De Bruyne', 'position': 'Midfielder', 'club': 'Manchester City', 'nationality': 'Belgian'}
] %}
-- models/postgres_model/jinja.sql

-- Define the player data
with player_data as (
    select
        '{{ players[0].name }}' as name,
        '{{ players[0].position }}' as position,
        '{{ players[0].club }}' as club,
        '{{ players[0].nationality }}' as nationality
    {% for player in players[1:] %}
    union all
    select
        '{{ player.name }}' as name,
        '{{ player.position }}' as position,
        '{{ player.club }}' as club,
        '{{ player.nationality }}' as nationality
    {% endfor %}
)

select * from player_data

