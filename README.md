## broker

### O projekcie
Prognozowanie indeksu Dow Jones Industrial z użyciem modelu ARIMA, sieci neuronowych oraz przetwarzania języka naturalnego.

Idea projektu przewiduje stowrzenie serwisu wspomagającego podejmowanie decyzji podczas inwestowania na giełdzie. Przedmiotem projektu
stał się indeks akcji Dow Jones Industrial Average, jest to jeden
z najważniejszych indeksów akcji spółek notowanych na Giełdzie Papierów Wartościowych w Nowym Jorku (New York Stock Exchange) i NASDAQ.
Indeks ten został stworzony przez Charlesa Dowa i statystyka Edwarda Jonesa. Indeks Dow Jones jest najstarszym działającym indeksem akcji
w Stanach Zjednoczonych. Obecnie składa się on z 30 największych amerykańskich przedsiębiorstw [wikipedia](https://pl.wikipedia.org/wiki/Dow_Jones_Industrial_Average).
Rekordy indeksu pobierane są z portalu [stooq.com](https://stooq.com/) w postaci pliku csv,
następnie trafiają do bazy danych PostgreSQL, ta operacja wykonywana jest przez skrypt w języku Ruby.
W celu prognozy z użyciem modelu ARIMA i sieci neuronowych użyto takie paczki jak "forecast", "tseries" i "lubridate" oraz środowiska R,
każdorazowa prognoza trafia do bazy danych i jej wyniki prezentowane są na stronie web. Dodatkowo przeprowadzana jest analiza najnowszych
wiadomości dotyczących wspomaniego indeksu giełdowego. Wiadomości pobierane są ze stron
[www.marketwatch.com](https://www.marketwatch.com/investing/index/djia/news) oraz
[www.cnbc.com](https://www.cnbc.com/quotes/?symbol=.DJI) następnie za pomocą paczek "rvest", "dplyr", "stringr", "tm",
"SentimentAnalysis" i środowiska R przeprowadzana jest analiza artykułów pod kątem nastrojów wyrażanych w treści.
Analiza zapisywana jest w bazie. Warstwa prezentacji pobieranych i opracowywanych danych wykonan została za pomocą frameworku Ruby On Rails.

### Autor
* [Kamil Pek](https://github.com/kamilpek)

### Wersja
* v0.1.2 (26.01.2018)
