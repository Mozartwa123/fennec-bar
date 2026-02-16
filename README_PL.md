# Fennec-bar

![image](./test.png)

### O projekcie

<div style="text-align: justify">
  Fennec-bar to pasek zadań napisany od zera w Qt we frameworku Quickshell. Tworzony jest z myślą o hyprexin, czyli przypuszczalnym pulpicie w oparciu o kompozytor Hyprland dla Linexin - młodej dystrybucji linuxa, stworzonej przez Linexy - polskiego youtubera. Mam ambicję przyczynić się do tego, aby hyprexin, jako pulpit dla wspomnianej dystrybucji stał się faktem, tworząc własne dotsy (czyli pliki konfiguracyjne) hyprlanda, mimo że moje umiejętności programistyczne są raczej żadne.
</div>

### Dlaczego nie waybar?

<div style="text-align: justify">

Gdybym wiedział, że okiełznanie quickshell'a zajmie mi tak dużo czasu (prawie tydzień), z pewnością fennec-bar zostałby zaimplementowany przy użyciu waybara. Jednak propaganda youtuberów linuxiarzy robi swoje (tzn. przestań używać tego, użyj tamtego, bo lepsze, bo "trendy"), więc rzuciłem się na to, mimo że dokumentacja nie była zbyt szczegółowa. Za to, trzeba przyznać, że quickshell ma jednak większe możliwości - pop-upy (czyli rozsuwane fragmenty panelu), animacje oraz większe pole do manewru w zakresie programowania logiki działania (np. zmiana tła ikony baterii w zależności od poziomu jej naładowania - w waybarze raczej możliwa byłaby tylko zmiana ikony) i wiele więcej, prawdopodobnie jest jeszcze ogrom funkcji, o których jeszcze nie wiem. Dlatego ostatecznie quickshell raczej pozostanie.

</div>

## Funkcje

<div style = "text-align: justify">

Co udało mi się zaimplementować w tydzień? Prawdę mówiąc nie wiele, ale po kolei:

- Applet z godziną i datą na środku panelu

- Przycisk zasilania - po naciśnięciu rozwija się menu z możliwością uśpienia, wylogowania się z hyprlanda, ponownego uruchomienia i wyłączenia komputera

- Applet z baterią - w logice zaimplementowałem progi poziomu zasilania, tzn.  po przekroczeniu pewnych progów applet zmienia kolor (i ikonę baterii) , im niższy stopień zasilania, tym applet ma cieplejsze barwy, by skłonić użytkownika do podpięcia ładowarki. Ponadto jest też osobne tło w przypadku ładującej się baterii, które pozostaje takie samo, aż do pełnego naładowania, wtedy zmienia kolor, co daje znać użytkownikowi, że czas odłączyć komputer od ładowania

- Applet z dźwiękiem - pokazuje poziom głośności, po kliknięciu wyskakuje pop-Up, gdzie można za pomocą suwaka zmienić natężenie dźwięku oraz go wyłączać/włączać.

- Tacka systemowa (ang. tray) - wszystkie aplikacje, które ją wspierają (np. nm-applet, osb-studio, discord, steam, spotify, itp.), będą tam lądować - prawym przyciskiem myszy otwieramy menu, lewym otwieramy aplikację, środkowym "drugorzędne" uruchomienie, jeśli takie istnieje. UWAGA! Menu ma bugi na hyprlandzie. Zachęcam do przeczytania detykowanej temu [sekcji](#bugi).  

- Menu start - wymaga rofi do działania, gdyż naciśnięcie jego powoduje włączenie właśnie tego uruchamiacza aplikacji (w przyszłości rofi zostanie wyeliminowany całkowicie - ze względu na to, że słabo działa z dotykiem i jest raczej prostym launcherem, specjalnie dla użytkowników, którzy cenią używanie klawiatury)

- Przełączniki pulpitów wirtualnych (ang. workspaców) - pokazują aktywne pulpity (czyli te, na których jest jakiekolwiek okno). UWAGA! Quickshell ma wbudowane api do komunikacji z hyprlandem. Użyłem tego, a to oznacza, że ten przełącznik NIE ZADZIAŁA, na innych menadżerach okien, jak niri, i3wm, qtile i cała rzesza innego oprogramowania tego typu:)

- Różne animacje:) - powiększanie się ikon po najechaniu, ładna, "żelkowa", animacja rozwijanie pop-upów. 

</div>

### O projekcie

<div style="text-align: justify">
  Fennec-bar to pasek zadań napisany od zera w Qt we frameworku Quickshell. Tworzony jest z myślą o hyprexin, czyli przypuszczalnym pulpicie w oparciu o kompozytor Hyprland dla Linexin - młodej dystrybucji linuxa, stworzonej przez Linexy - polskiego youtubera. Mam ambicję przyczynić się do tego, aby hyprexin, jako pulpit dla wspomnianej dystrybucji stał się faktem, tworząc własne dotsy (czyli pliki konfiguracyjne) hyprlanda, mimo że moje umiejętności programistyczne są raczej żadne.
</div>

### Dlaczego nie waybar?

<div style="text-align: justify">

Gdybym wiedział, że okiełznanie quickshell'a zajmie mi tak dużo czasu (prawie tydzień), z pewnością fennec-bar zostałby zaimplementowany przy użyciu waybara. Jednak propaganda youtuberów linuxiarzy robi swoje (tzn. przestań używać tego, użyj tamtego, bo lepsze, bo "trendy"), więc rzuciłem się na to, mimo że dokumentacja nie była zbyt szczegółowa. Za to, trzeba przyznać, że quickshell ma jednak większe możliwości - pop-upy (czyli rozsuwane fragmenty panelu), animacje oraz większe pole do manewru w zakresie programowania logiki działania (np. zmiana tła ikony baterii w zależności od poziomu jej naładowania - w waybarze raczej możliwa byłaby tylko zmiana ikony) i wiele więcej, prawdopodobnie jest jeszcze ogrom funkcji, o których jeszcze nie wiem. Dlatego ostatecznie quickshell raczej pozostanie.

</div>

## Funkcje

<div style = "text-align: justify">

Co udało mi się zaimplementować w tydzień? Prawdę mówiąc nie wiele, ale po kolei:

- Applet z godziną i datą na środku panelu

- Przycisk zasilania - po naciśnięciu rozwija się menu z możliwością uśpienia, wylogowania się z hyprlanda, ponownego uruchomienia i wyłączenia komputera

- Applet z baterią - w logice zaimplementowałem progi poziomu zasilania, tzn.  po przekroczeniu pewnych progów applet zmienia kolor (i ikonę baterii) , im niższy stopień zasilania, tym applet ma cieplejsze barwy, by skłonić użytkownika do podpięcia ładowarki. Ponadto jest też osobne tło w przypadku ładującej się baterii, które pozostaje takie samo, aż do pełnego naładowania, wtedy zmienia kolor, co daje znać użytkownikowi, że czas odłączyć komputer od ładowania

- Applet z dźwiękiem - pokazuje poziom głośności, po kliknięciu wyskakuje pop-Up, gdzie można za pomocą suwaka zmienić natężenie dźwięku oraz go wyłączać/włączać.

- Tacka systemowa (ang. tray) - wszystkie aplikacje, które ją wspierają (np. nm-applet, osb-studio, discord, steam, spotify, itp.), będą tam lądować - prawym przyciskiem myszy otwieramy menu, lewym otwieramy aplikację, środkowym "drugorzędne" uruchomienie, jeśli takie istnieje. UWAGA! Menu ma bugi na hyprlandzie. Zachęcam do przeczytania detykowanej temu [sekcji](#bugi).  

- Menu start - wymaga rofi do działania, gdyż naciśnięcie jego powoduje włączenie właśnie tego uruchamiacza aplikacji (w przyszłości rofi zostanie wyeliminowany całkowicie - ze względu na to, że słabo działa z dotykiem i jest raczej prostym launcherem, specjalnie dla użytkowników, którzy cenią używanie klawiatury)

- Przełączniki pulpitów wirtualnych (ang. workspaców) - pokazują aktywne pulpity (czyli te, na których jest jakiekolwiek okno). UWAGA! Quickshell ma wbudowane api do komunikacji z hyprlandem. Użyłem tego, a to oznacza, że ten przełącznik NIE ZADZIAŁA, na innych menadżerach okien, jak niri, i3wm, qtile i cała rzesza innego oprogramowania tego typu:)

- Różne animacje:) - powiększanie się ikon po najechaniu, ładna, "żelkowa", animacja rozwijanie pop-upów. 

</div>

## Bugi

![](trayBug.mp4)

<div style = "text-align: justify">

Na hyprlandzie niestety rozwijane menu w Tray miewa glicze..., próbowałem to naprawić, ale nie wiem, co jest przyczyną. Sprawdziłem działanie tego na kde plasma - i działało to bez zarzutu, widocznie hyprland miał jakieś problemy z wyrenderowaniem tego. W aktualnym stanie - menu funkcjonuje bez żadnego opakowania - w kodzie jest po prostu funkcja display do pokazywania tego menu wbudowana w quickshell i nic więcej z tym nie robię. Problemu nie ma z innymi pop-upami, dlatego, że ich kod został napisany od zera przeze mnie. Dlatego będę musiał też napisać odpowiedni pop-up dla elementów tacki systemowej (czyli właśnie Traya) - jest to i tak konieczność, aby wygląd wszystkich pop-upów był spójny - teraz nie jest.

Niestety nie ma jeszcze powiadomień - dlatego, że pasek był pisany na systemie z preinstalowaną kde plasmą (jest to właśnie linexin, do którego rozwoju chciałbym się przyczynić konfiguracją do hyprlanda), która ma już własny system powiadomień. Będę testować to też na systemie bez innych środowisk graficznych.

</div>

## Do wykonania

Na razie - nie jest to zbyt konfigurowalne - to znaczy kod można edytować - qml jest raczej intuicyjny i w przypadku quickshella znajomość programowania w c++ pod qt nie jest wymagana - jest to prostsze niż dwm (dlatego, że nie trzeba tego kompilować), ale komentarzy za dużo nie ma, kod jest chaotyczny, brakuje też jednego pliku konfiguracyjnego do ustawienia kolorów - co przyda się, bo nie chcę się ograniczać do fioletu, który jest kolorem przewodnim dla GUI linexina. Będę nad tym pracował, jeśli chcesz pomóc oto lista innych rzeczy do zrobienia:

## Bugi

![](trayBug.mp4) 
 
<div style = "text-align: justify">

Na hyprlandzie niestety rozwijane menu w Tray miewa glicze..., próbowałem to naprawić, ale nie wiem, co jest przyczyną. Sprawdziłem działanie tego na kde plasma - i działało to bez zarzutu, widocznie hyprland miał jakieś problemy z wyrenderowaniem tego. W aktualnym stanie - menu funkcjonuje bez żadnego opakowania - w kodzie jest po prostu funkcja display do pokazywania tego menu wbudowana w quickshell i nic więcej z tym nie robię. Problemu nie ma z innymi pop-upami, dlatego, że ich kod został napisany od zera przeze mnie. Dlatego będę musiał też napisać odpowiedni pop-up dla elementów tacki systemowej (czyli właśnie Traya) - jest to i tak konieczność, aby wygląd wszystkich pop-upów był spójny - teraz nie jest.

Niestety nie ma jeszcze powiadomień - dlatego, że pasek był pisany na systemie z preinstalowaną kde plasmą (jest to właśnie linexin, do którego rozwoju chciałbym się przyczynić konfiguracją do hyprlanda), która ma już własny system powiadomień. Będę testować to też na systemie bez innych środowisk graficznych.

</div>

## Do wykonania

Na razie - nie jest to zbyt konfigurowalne - to znaczy kod można edytować - qml jest raczej intuicyjny i w przypadku quickshella znajomość programowania w c++ pod qt nie jest wymagana - jest to prostsze niż dwm (dlatego, że nie trzeba tego kompilować), ale komentarzy za dużo nie ma, kod jest chaotyczny, brakuje też jednego pliku konfiguracyjnego do ustawienia kolorów - co przyda się, bo nie chcę się ograniczać do fioletu, który jest kolorem przewodnim dla GUI linexina. Będę nad tym pracował, jeśli chcesz pomóc oto lista innych rzeczy do zrobienia:

  Fennec-bar to pasek zadań napisany od zera w Qt we frameworku Quickshell. Tworzony jest z myślą o hyprexin, czyli przypuszczalnym pulpicie w oparciu o kompozytor Hyprland dla Linexin - młodej dystrybucji linuxa, stworzonej przez Linexy - polskiego youtubera. Mam ambicję przyczynić się do tego, aby hyprexin, jako pulpit dla wspomnianej dystrybucji stał się faktem, tworząc własne dotsy (czyli pliki konfiguracyjne) hyprlanda, mimo że moje umiejętności programistyczne są raczej żadne.

</div>

### Dlaczego nie waybar?

<div style="text-align: justify">

Gdybym wiedział, że okiełznanie quickshell'a zajmie mi tak dużo czasu (prawie tydzień), z pewnością fennec-bar zostałby zaimplementowany przy użyciu waybara. Jednak propaganda youtuberów linuxiarzy robi swoje (tzn. przestań używać tego, użyj tamtego, bo lepsze, bo "trendy"), więc rzuciłem się na to, mimo że dokumentacja nie była zbyt szczegółowa. Za to, trzeba przyznać, że quickshell ma jednak większe możliwości - pop-upy (czyli rozsuwane fragmenty panelu), animacje oraz większe pole do manewru w zakresie programowania logiki działania (np. zmiana tła ikony baterii w zależności od poziomu jej naładowania - w waybarze raczej możliwa byłaby tylko zmiana ikony) i wiele więcej, prawdopodobnie jest jeszcze ogrom funkcji, o których jeszcze nie wiem. Dlatego ostatecznie quickshell raczej pozostanie.

</div>

## Funkcje

<div style = "text-align: justify">

Co udało mi się zaimplementować w tydzień? Prawdę mówiąc nie wiele, ale po kolei:

- Applet z godziną i datą na środku panelu

- Przycisk zasilania - po naciśnięciu rozwija się menu z możliwością uśpienia, wylogowania się z hyprlanda, ponownego uruchomienia i wyłączenia komputera

- Applet z baterią - w logice zaimplementowałem progi poziomu zasilania, tzn.  po przekroczeniu pewnych progów applet zmienia kolor (i ikonę baterii) , im niższy stopień zasilania, tym applet ma cieplejsze barwy, by skłonić użytkownika do podpięcia ładowarki. Ponadto jest też osobne tło w przypadku ładującej się baterii, które pozostaje takie samo, aż do pełnego naładowania, wtedy zmienia kolor, co daje znać użytkownikowi, że czas odłączyć komputer od ładowania

- Applet z dźwiękiem - pokazuje poziom głośności, po kliknięciu wyskakuje pop-Up, gdzie można za pomocą suwaka zmienić natężenie dźwięku oraz go wyłączać/włączać.

- Tacka systemowa (ang. tray) - wszystkie aplikacje, które ją wspierają (np. nm-applet, osb-studio, discord, steam, spotify, itp.), będą tam lądować - prawym przyciskiem myszy otwieramy menu, lewym otwieramy aplikację, środkowym "drugorzędne" uruchomienie, jeśli takie istnieje. UWAGA! Menu ma bugi na hyprlandzie. Zachęcam do przeczytania detykowanej temu [sekcji](#bugi).  

- Menu start - wymaga rofi do działania, gdyż naciśnięcie jego powoduje włączenie właśnie tego uruchamiacza aplikacji (w przyszłości rofi zostanie wyeliminowany całkowicie - ze względu na to, że słabo działa z dotykiem i jest raczej prostym launcherem, specjalnie dla użytkowników, którzy cenią używanie klawiatury)

- Przełączniki pulpitów wirtualnych (ang. workspaców) - pokazują aktywne pulpity (czyli te, na których jest jakiekolwiek okno). UWAGA! Quickshell ma wbudowane api do komunikacji z hyprlandem. Użyłem tego, a to oznacza, że ten przełącznik NIE ZADZIAŁA, na innych menadżerach okien, jak niri, i3wm, qtile i cała rzesza innego oprogramowania tego typu:)

- Różne animacje:) - powiększanie się ikon po najechaniu, ładna, "żelkowa", animacja rozwijanie pop-upów. 

</div>

## Bugi

<div style = "text-align: justify">

Na hyprlandzie niestety rozwijane menu w Tray miewa glicze..., próbowałem to naprawić, ale nie wiem, co jest przyczyną. Sprawdziłem działanie tego na kde plasma - i działało to bez zarzutu, widocznie hyprland miał jakieś problemy z wyrenderowaniem tego. W aktualnym stanie - menu funkcjonuje bez żadnego opakowania - w kodzie jest po prostu funkcja display do pokazywania tego menu wbudowana w quickshell i nic więcej z tym nie robię. Problemu nie ma z innymi pop-upami, dlatego, że ich kod został napisany od zera przeze mnie. Dlatego będę musiał też napisać odpowiedni pop-up dla elementów tacki systemowej (czyli właśnie Traya) - jest to i tak konieczność, aby wygląd wszystkich pop-upów był spójny - teraz nie jest.

Niestety nie ma jeszcze powiadomień - dlatego, że pasek był pisany na systemie z preinstalowaną kde plasmą (jest to właśnie linexin, do którego rozwoju chciałbym się przyczynić konfiguracją do hyprlanda), która ma już własny system powiadomień. Będę testować to też na systemie bez innych środowisk graficznych.

</div>

## Do wykonania

Na razie - nie jest to zbyt konfigurowalne - to znaczy kod można edytować - qml jest raczej intuicyjny i w przypadku quickshella znajomość programowania w c++ pod qt nie jest wymagana - jest to prostsze niż dwm (dlatego, że nie trzeba tego kompilować), ale komentarzy za dużo nie ma, kod jest chaotyczny, brakuje też jednego pliku konfiguracyjnego do ustawienia kolorów - co przyda się, bo nie chcę się ograniczać do fioletu, który jest kolorem przewodnim dla GUI linexina. Będę nad tym pracował, jeśli chcesz pomóc oto lista innych rzeczy do zrobienia:

- Dla porządku przypomnę - jeden lub kilka plików konfiguracyjnych (najlepiej w formacie json, albo pliku js, czyli javascriptu)

- Dodanie tłumaczeń (najlepiej plik json - i osobny skrypt CLi Pythona (bo ma wygodne narzędzia do edycji jsonów, a javascript jest chyba najgorszym językiem do CLi), do wzbogacania tego pliku o nowe tłumaczenia), narazie jest to projekt z językiem polskim z niewielką domieszką angielskiego (nie ma angielskiego w menu zasilania, bo nie mieścił mi się, ale przyciski raczej powinny pomóc). Qt ma swoje narzędzia, jak QsTr, ale niestety do prostych ono nie należy, w każdym razie nie starczyło mi rozumu do pojęcia tego. Poza tym, i tak jest to raczej tłumaczenie paru słów, więc nie wymaga to ogromnego przedsięwzięcia.

- Dodanie innych appletów - powiadomienia (ważne), do graficznej zmiany styli całego ekosystemu hyprland, może jakiegoś managera sterowników, informacje o zużytej pamięciu RAM, zużyciu procesora, itd.

- Usunięcie rofi (wspominałem o tym)

- Mam ambicję nawet patchować hyprlanda. Choć brzmi to nieprawdopodobnie, widzę w nim potencjał do obsługi dotyku (można zmapować niektóre skróty do gestów na ekranie, niektóre można zastąpić odpowiednimi przyciskami na panelu). Na razie, zielony jak trawa na wiosnę jestem z wiedzy o kompozytorze wayland (o serwerze xorg nawet nie wspominając), nie będę się tego podejmował..

- Powiedziałem o patchowaniu hyprlanda - jedną z rzeczy, która bardzo wkurza użytkowników jest brak możliwości edycji splashy (czyli humorystycznych napisów wyskakujących po włączeniu kompozytora), bez ponownej kompilacji całego środowiska (splashe są ukryte w pliku nagłówkowym c++ pod postacią wektora), a to raczej trudne nie jest, wystarczy dodać wczytywanie odpowiedniego pliku ze splashami i to raczej wystarczy. Pozornie głupi, niepotrzebny pomysł może przynieść poprawę jakości użytkowania, dlatego, że ustawiając w odpowiednim pliku ulubione żarty, czy najpiękniejsze cytaty z literatury, może to poprawić motywację użytkownika do pracy, a obecne splashe to raczej specyficzny humor dla dewelopera hyprlanda (z całym szacunkiem do niego) i nie każdego będzie on bawił. Ale też nie będę się tego podejmował na ten moment.

- Dużo użytkowników windowsa, macos, czy nawet niektórych świeżych użytkowników linuxa - sceptycznie patrzy na kafelkowe menadżery okien (ang. tiling window manager, w skrócie TWM), mówiąc "Myszkę wynaleziono po to, by nie musieć używać klawiatury", niedostrzegając, jak opanowanie TWM przyśpiesza pracę (anegdota: nie tak dawno niri - czyli inny TWM ze wsparciem skrolowania okien - uratował zaliczenie z pewnego przedmiotu - projekt internetowej gry kółko i krzyżyk udało mi się zrobić w dwa dni - przy tradycyjnym układzie z myszką i niekafelkowalnymi oknami straciłbym dodatkowy czas na opanowanie bałaganu na pulpicie, a tak to parę razy wystarczyło przeskrolować do innego okna i ten czas został zaoszczędzony). Dlatego myślę nad opracowaniem interaktywnego tutoriala do hyprexina. W ten sposób użytkownik szybciej pojmie sposób użytkowania i nie straci mnóstwo czasu na konfigurowanie, przekopywanie dokumentacji i męczeniem biednych zziajanych czatów AI.

- Wydaje mi się, że awaryjna konfiguracja waybara jednak by się przydała (jesli komuś bardzo zależy, np. na zasobach i niezawodności - quickshell to jednak młody projekt). Na swoim niri mam jeden, ale 90% kodu zostało napisane przez AI (chciałem kiedyś bardzo szybko skonfigurować swayfx - inny kompozytor waylanda, dlatego poszedłem na łatwiznę), więc z czystej, ludzkiej przyzwoitości, tamtej konfiguracji nie wrzucę. Najlepiej będzie zrobić dla Fennec-waybar osobne repozytorium.

- Stworzenie paczki tar.gz na prostszej dystrybucji projektu
  
  Jeżeli chcesz pomóc (najlepiej zanim zaczniesz cokolwiek pisać, żeby zapobiec ewentualnej syzyfowej pracy), napisz do mnie na mail: mozartwa123@gmail.com lub w jakieś zakładce na github - wtedy zostaniesz dopisany do tej listy. Jeżeli poczujesz wypalenie, proszę się niekrępować, zrozumiem, wtedy z listy zostaniesz wypisany. W przypadku chociaż częściowej realizacji któregoś z punktu zostaniesz dopisany do listy kontrybutorów:)

- </div>

## Instalacja, czy co gdzie położyć

Stworzyłem dedykowany skrypt instalacyjny o nazwie **setup.sh**. Powstał na szybko, i jeszcze go nie testowałem (za parę dni, może być już przetestowany, więc proszę o cierpliwość), jest bardzo prosty - instaluje zależności, czyli quickshell, ttf-meslo-nerd (czcionka - bardzo ważna, bo z niej pochodzi większość ikon) oraz stow (do łatwiego tworzenia dowiązań symbolicznych, czyli skrótów), zmienia właściciela repozytorium na użytkownika, przenosi całe repozytorium do katalogu ~/.fennec-bar, tworzy symlink między katalogami ~/.config/quickshell, a ~/.fennec-bar/config/quickshell. Dzięki temu update konfiguracji powinien być możliwy na drodze zaktualizowania repozytorium, czyli wydania komendy:

`    git pull`

W katalogu ~/.fennec-bar. Skrypt instalacyjny powinno się (w tym samym katalogu) uruchomić następująco

`chown +x setup.sh && ./setup.sh`

Dla uspokojenia - w skrypcie dwa razy proszę o uprawnienia administratora - pierwszy raz - żeby zainstalować zależności przy użyciu pacmana, drugi raz, przy zmianie właściciela plików repozytorium (chociaż nie jestem pewien, czy to jest rzeczywiście konieczne).

Planuję też repozytorium pacmana, żeby całą konfigurację istalować przy użyciu tego menadżera pakietów.

Niestety skrypt wymaga systemu opartego o arch linux, podobnie jak linexin (przynajmniej w kwestii instalacji zależności), na debianie na przykład, postawienie tego graniczy z CUDEM, ponieważ quickshell nie ma nawet w repozytorium debiana sida, więc trzeba ręcznie go kompilować razem z zależnościami, których jest bardzo dużo.

## Linki, czyli co wykorzystałem

Przede wszystkim tapeta oraz ikona fenka w menu start są autorstwa twórcy [linexina](https://github.com/Petexy).

Tutaj link do projektu [linexin]([GitHub - Petexy/Linexin: Arch-based distro for my usage](https://github.com/Petexy/Linexin)).

A tu do projektu [Quickshell](https://quickshell.org/), oraz [Hyprland](https://hypr.land/)

Oczywiście podam link do dotsów do mojej nieoficjalnej koncepcji hyprexina, gdy tylko napiszę toporne README do niego i utworzę odpowiednie repozytorium.

Miłego korzystania, jeśli się odważysz:)
