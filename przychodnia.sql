-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Lut 2023, 17:14
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `przychodnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gabinety`
--

CREATE TABLE `gabinety` (
  `idpokoju` int(11) NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `gabinety`
--

INSERT INTO `gabinety` (`idpokoju`, `opis`) VALUES
(2, 'nr.20 pierwsze piętro'),
(3, 'nr. 3 parter'),
(4, 'nr. 14 pierwsze piętro'),
(5, 'nr.5 parter'),
(6, 'nr. 1 parter');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kalendarz_pacjenta`
--

CREATE TABLE `kalendarz_pacjenta` (
  `idkalendarz` int(11) NOT NULL,
  `idwizyty` int(11) DEFAULT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `data` date NOT NULL,
  `miesiac` text NOT NULL,
  `nowa_godzina` time DEFAULT NULL,
  `idpacjenta` int(11) NOT NULL,
  `idpracownika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `kalendarz_pacjenta`
--

INSERT INTO `kalendarz_pacjenta` (`idkalendarz`, `idwizyty`, `opis`, `status`, `data`, `miesiac`, `nowa_godzina`, `idpacjenta`, `idpracownika`) VALUES
(2, 8, 'Kontrola', 'aktualna', '2023-01-17', '', '09:00:00', 0, 0),
(3, 9, 'Szczepienie', 'aktualna', '2023-01-25', '', '13:25:00', 0, 0),
(6, NULL, 'Wizyta kontrolna', NULL, '0000-00-00', 'Luty', NULL, 15, 7),
(7, NULL, 'Wizyta kontrolna', NULL, '0000-00-00', 'Luty', NULL, 15, 7),
(8, NULL, 'Wizyta kontrolna', NULL, '0000-00-00', 'Luty', NULL, 15, 7),
(9, NULL, 'Wizyta kontrolna', NULL, '0000-00-00', 'Luty', NULL, 15, 7),
(10, NULL, 'Wizyta kontrolna', NULL, '2022-02-24', 'Luty', NULL, 15, 7),
(11, NULL, 'Konsultacja', NULL, '2022-03-07', 'Marzec', NULL, 15, 7),
(12, NULL, 'Pierwsza wizyta', NULL, '2022-02-12', 'Luty', NULL, 15, 9),
(13, NULL, 'Wizyta kontrolna', NULL, '2022-03-06', 'Marzec', NULL, 15, 9),
(14, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 15, 9),
(15, NULL, 'Pierwsza wizyta', NULL, '2022-02-04', 'Luty', NULL, 15, 7),
(16, NULL, 'Wizyta kontrolna', NULL, '2022-02-06', 'Luty', NULL, 15, 7),
(17, NULL, 'Konsultacja', NULL, '2022-02-04', 'Luty', NULL, 15, 7),
(18, NULL, 'Konsultacja', NULL, '2022-02-04', 'Luty', NULL, 15, 7),
(19, NULL, 'Konsultacja', NULL, '2022-02-04', 'Luty', NULL, 15, 7),
(20, NULL, 'Wizyta kontrolna', NULL, '2022-03-04', 'Marzec', NULL, 15, 7),
(21, NULL, 'Pierwsza wizyta', NULL, '2022-03-05', 'Marzec', NULL, 42, 8),
(22, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 14, 7),
(23, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 14, 7),
(24, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 14, 0),
(25, NULL, 'Konsultacja', NULL, '2022-01-04', 'Styczeń', NULL, 15, 7),
(26, NULL, 'Konsultacja', NULL, '2022-01-14', 'Styczeń', NULL, 15, 7),
(27, NULL, 'Konsultacja', NULL, '2022-01-14', 'Styczeń', NULL, 15, 7),
(28, NULL, 'Konsultacja', NULL, '2022-01-09', 'Styczeń', NULL, 15, 7),
(29, NULL, 'Pierwsza wizyta', NULL, '2022-01-28', 'Styczeń', NULL, 15, 7),
(30, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 44, 7),
(31, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 44, 7),
(32, NULL, 'Pierwsza wizyta', NULL, '2022-01-08', 'Styczeń', NULL, 44, 8),
(33, NULL, 'Wizyta kontrolna', NULL, '2022-01-01', 'Styczeń', NULL, 15, 4),
(34, NULL, 'Pierwsza wizyta', NULL, '2022-02-15', 'Luty', NULL, 46, 8),
(35, NULL, 'Pierwsza wizyta', NULL, '2022-01-01', 'Styczeń', NULL, 51, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kalendarz_pracownika`
--

CREATE TABLE `kalendarz_pracownika` (
  `idzadania` int(11) NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `idterminu` int(11) DEFAULT NULL,
  `miesiac` text DEFAULT NULL,
  `rok` text DEFAULT NULL,
  `data` date DEFAULT NULL,
  `idpracownika` text DEFAULT NULL,
  `imie_i_nazwisko_pacjenta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `kalendarz_pracownika`
--

INSERT INTO `kalendarz_pracownika` (`idzadania`, `opis`, `idterminu`, `miesiac`, `rok`, `data`, `idpracownika`, `imie_i_nazwisko_pacjenta`) VALUES
(4, 'Sprzątanie toalet', 7, 'styczeń', '2022', '2022-01-07', '12', ''),
(5, 'Badanie ginekologiczne', 8, 'styczeń', '2022', '2022-01-09', NULL, ''),
(6, 'Konsultacja', NULL, 'Luty', '2022', '2022-02-04', '7', ''),
(7, 'Konsultacja', NULL, 'Luty', '2022', '2022-02-04', '7', ''),
(8, 'Wizyta kontrolna', NULL, 'Marzec', '2022', '2022-03-04', '7', ''),
(9, 'Pierwsza wizyta', NULL, 'Marzec', '2022', '2022-03-05', '8', ''),
(10, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '7', ''),
(11, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '7', ''),
(12, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '0', ''),
(13, 'Konsultacja', NULL, 'Styczeń', '2022', '2022-01-04', '7', ''),
(14, 'Konsultacja', NULL, 'Styczeń', '2022', '2022-01-14', '7', ''),
(15, 'Konsultacja', NULL, 'Styczeń', '2022', '2022-01-14', '7', ''),
(16, 'Konsultacja', NULL, 'Styczeń', '2022', '2022-01-09', '7', ''),
(17, 'Pierwsza wizyta', NULL, 'Styczeń', '2022', '2022-01-28', '7', ''),
(18, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '7', 'Andrej Duda'),
(19, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '7', 'Andrej Duda'),
(20, 'Pierwsza wizyta', NULL, 'Styczeń', '2022', '2022-01-08', '8', 'Beata Duda'),
(21, 'Wizyta kontrolna', NULL, 'Styczeń', '2022', '2022-01-01', '4', 'dfs'),
(22, 'Pierwsza wizyta', NULL, 'Luty', '2022', '2022-02-15', '8', 'Nikodem Fifarafa'),
(23, 'Pierwsza wizyta', NULL, 'Styczeń', '2022', '2022-01-01', '7', 'Michał  Pjerd');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarze`
--

CREATE TABLE `lekarze` (
  `idlekarza` int(11) NOT NULL,
  `specjalizacja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `idpracownika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `lekarze`
--

INSERT INTO `lekarze` (`idlekarza`, `specjalizacja`, `idpracownika`) VALUES
(1, 'Ginekolog', 7),
(2, 'Psychiatra', 8),
(3, 'Kardiolog', 9),
(4, 'Neurolog', 4),
(5, 'Dermatolog', 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `idleku` int(11) NOT NULL,
  `nazwa` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `leki`
--

INSERT INTO `leki` (`idleku`, `nazwa`, `opis`) VALUES
(2, 'ibum', 'przeciwbólowy'),
(3, 'bąbel', 'kojący płyn do kąpieli'),
(4, 'wierzbownica z magnezem', 'suplement diety'),
(5, 'ralago', 'tabletki na parkinsona');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logowanie`
--

CREATE TABLE `logowanie` (
  `idlogowania` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `znacznik` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `logowanie`
--

INSERT INTO `logowanie` (`idlogowania`, `login`, `haslo`, `znacznik`) VALUES
(3, 'albiniprzybyl', 'albinos123', '2023-01-04 19:36:22'),
(4, 'matildziamuch', 'muszka1994', '2023-01-04 19:36:22'),
(5, 'szymper', 'szymon000', '2023-01-04 19:46:10'),
(6, 'karina20', '123', '2023-01-04 19:46:10'),
(7, 'mieciu', 'konserwator111', '2023-01-04 19:50:39'),
(8, 'sarcia', 'wierzbicka1999', '2023-01-04 19:50:39'),
(9, 'grzegorz', 'Pawlik1', '2023-01-04 19:52:32'),
(10, 'Alfredzik', 'Chmielu', '2023-01-04 19:52:32'),
(11, 'Wicia', 'Maciejka', '2023-01-04 19:53:05'),
(12, 'Artur', 'Ptaki<3', '2023-01-04 19:53:05'),
(13, 'bogusia12', 'krupa', '2023-01-04 19:58:02'),
(14, 'wacek', '9ccbd3e247e580e9f7523842068b07999bbcc81c', '2023-01-07 21:49:31'),
(28, 'trtrt', '90795a0ffaa8b88c0e250546d8439bc9c31e5a5e', '2023-01-30 17:19:37'),
(29, 'sdas', 'fedd1d1122aa65028c81e16ceb85d9c73790a2fa', '2023-01-30 17:19:55'),
(30, 'sdas', 'fedd1d1122aa65028c81e16ceb85d9c73790a2fa', '2023-01-30 17:21:34'),
(31, 'sdas', 'fedd1d1122aa65028c81e16ceb85d9c73790a2fa', '2023-01-30 17:21:47'),
(32, 'fsdfs', 'fedd1d1122aa65028c81e16ceb85d9c73790a2fa', '2023-01-30 17:21:55'),
(33, 'hbfjhiabsfhj', '8d4e467cbf5855f15573842412d6f560ba6efc9a', '2023-01-30 19:24:51'),
(34, 'turbina', '987321af6efed3cf3fd18f69ae5e560070fb144a', '2023-02-04 20:40:49'),
(35, 'dsadad', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', '2023-02-04 20:43:44'),
(36, 'dsadad', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', '2023-02-04 20:49:53'),
(37, 'dsadad', '4347d0f8ba661234a8eadc005e2e1d1b646c9682', '2023-02-04 20:50:09'),
(38, 'mefedron', 'fc7d0918363eda662b0fd2b8294d06d38f5edbcc', '2023-02-04 20:53:11'),
(39, 'wierzbicka1990', '311626c1f9a155545fef8c013e3a8346eb6e8a25', '2023-02-04 23:34:40'),
(40, 'wierzbicka1990', '311626c1f9a155545fef8c013e3a8346eb6e8a25', '2023-02-04 23:36:05'),
(41, 'grzechU13', 'd70cbf414d9bd7b7e3b3eca71311e09fdea3db87', '2023-02-05 00:37:48'),
(42, 'grzechU13', 'd70cbf414d9bd7b7e3b3eca71311e09fdea3db87', '2023-02-05 00:38:25'),
(43, 'dudu', 'd785625bd14bdb8f808654e6c2b1654afd272c59', '2023-02-05 12:14:47'),
(44, 'dudu', 'd785625bd14bdb8f808654e6c2b1654afd272c59', '2023-02-05 12:16:40'),
(45, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2023-02-05 13:21:55'),
(46, 'Jajeczko', 'a8cc3844e31fe86531b9672b2b5b2bafb338fb01', '2023-02-05 13:22:52'),
(47, 'chmiel', '7a91d1b444faa0b5bb08453ad38c8667d6e15380', '2023-02-05 13:57:45'),
(48, 'pertal69', '8bc82ca1c694faeacba4259bb5ca498564c595b3', '2023-02-05 13:59:33'),
(50, 'wrobel420', '0d70e9a5c9fa02d2ba1ed5bef1456e485bb8b684', '2023-02-05 14:04:47'),
(51, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2023-02-05 15:54:31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oferta`
--

CREATE TABLE `oferta` (
  `idoferty` int(11) NOT NULL,
  `tytul` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `oferta`
--

INSERT INTO `oferta` (`idoferty`, `tytul`, `opis`) VALUES
(2, 'Szczepienia', 'Szczepienia obowiązkowe:\r\ngruźlicy\r\nbłonicy\r\ntężcowi\r\nkrztuścowi\r\npoliomyelitis\r\nwirusowemu zapaleniu wątroby typu B\r\nHaemophilus influenzae typu b\r\nodrze\r\nśwince\r\nróżyczce'),
(3, 'Leki na receptę bez wizyty lekarskiej ', 'Jeśli przyjmujesz leki na stałe, nie musisz już rejestrować się do lekarza, wystarczy, że skorzystać z jednej z trzech możliwości: wyślesz do nas smsa, e-maila bądź złożysz kartkę z uzupełnionymi danymi w rejestracji.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `idpacjenta` int(11) NOT NULL,
  `imie` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `telefon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `pesel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `idlogowania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pacjenci`
--

INSERT INTO `pacjenci` (`idpacjenta`, `imie`, `nazwisko`, `telefon`, `pesel`, `email`, `idlogowania`) VALUES
(2, 'Albin', 'Przybylski', '695325167', '57041959110', 'albiniprzyb@op.pl', 3),
(3, 'Matylda', 'Mucha', '200564825', '52062121243', 'm.mucha@gmail.com', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platnosci`
--

CREATE TABLE `platnosci` (
  `idplatnosci` int(11) NOT NULL,
  `forma_platnosci` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `kwota` int(11) NOT NULL,
  `znizki` text NOT NULL,
  `kowta_po_znizkach` int(11) NOT NULL,
  `raty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `platnosci`
--

INSERT INTO `platnosci` (`idplatnosci`, `forma_platnosci`, `kwota`, `znizki`, `kowta_po_znizkach`, `raty`) VALUES
(2, 'karta', 250, '10%', 225, 'Nie'),
(3, 'Gotówka', 100, 'Brak', 100, 'Nie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `idpracownika` int(11) NOT NULL,
  `imie` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `pesel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `telefon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `idlogowania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`idpracownika`, `imie`, `nazwisko`, `pesel`, `telefon`, `email`, `idlogowania`) VALUES
(4, 'Szymon', 'Pertalec', '68021721991', '352165123', 'pertal333@onet.pl', 48),
(5, 'Karina', 'Majewska', '22041939501', '546123956', 'karinka123@gmail.com', 6),
(6, 'Mieczysław', 'Kopeć', '05272941736', '333654948', 'miecio45@op.pl', 7),
(7, 'Sara', 'Wierzbicka', '14271051067', '123415616', 'S.wierzbicka@onet.pl', 39),
(8, 'Grzegorz', 'Pawlik', '48021298651', '125362545', 'Pawlik@interia.com', 41),
(9, 'Alfred', 'Chmielewski', '07311997814', '356254986', 'Alfredchmiel@interia.pl', 47),
(10, 'Wiktoria', 'Maciejewska', '44112583985', '255333655', 'wiciamaj@op.pl', 11),
(11, 'Artur', 'Wróblewski', '13312504939', '365256965', 'Arturekwrobelek@onet.pl', 50),
(12, 'Wacław', 'Wacłowski', '22030232901', '125888956', 'wacek@op.pl', 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzet`
--

CREATE TABLE `sprzet` (
  `idurzadzenia` int(11) NOT NULL,
  `idpokoju` int(11) NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sprzet`
--

INSERT INTO `sprzet` (`idurzadzenia`, `idpokoju`, `opis`) VALUES
(2, 3, 'gabinet kardiologiczny'),
(3, 5, 'gabinet ginekologiczny'),
(4, 4, 'gabinet psychiatryczny'),
(5, 2, 'gabinet dermatologiczny'),
(6, 6, 'gabinet neurologiczny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `terminy`
--

CREATE TABLE `terminy` (
  `idterminu` int(11) NOT NULL,
  `data` date NOT NULL,
  `godzina` time NOT NULL,
  `rok` year(4) NOT NULL,
  `miesiac` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `terminy`
--

INSERT INTO `terminy` (`idterminu`, `data`, `godzina`, `rok`, `miesiac`) VALUES
(7, '2023-01-10', '15:00:00', 2023, 'styczeń'),
(8, '2023-01-16', '15:15:00', 2023, 'styczeń');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyty_zrealizowane`
--

CREATE TABLE `wizyty_zrealizowane` (
  `id_z_wizyty` int(11) NOT NULL,
  `idwizyty` int(11) NOT NULL,
  `opis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `recepta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `idleku` int(11) NOT NULL,
  `idplatnosci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `wizyty_zrealizowane`
--

INSERT INTO `wizyty_zrealizowane` (`id_z_wizyty`, `idwizyty`, `opis`, `recepta`, `idleku`, `idplatnosci`) VALUES
(9, 9, 'Szczepienie na gruźlicę', 'Brak', 4, 2),
(10, 8, 'Kontrola', 'Brak', 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapis_na_wizyte`
--

CREATE TABLE `zapis_na_wizyte` (
  `idwizyty` int(11) NOT NULL,
  `idlekarza` int(11) NOT NULL,
  `idpacjenta` int(11) NOT NULL,
  `idpokoju` int(11) NOT NULL,
  `czas_trwania` text NOT NULL,
  `idterminu` int(11) NOT NULL,
  `idoferty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `zapis_na_wizyte`
--

INSERT INTO `zapis_na_wizyte` (`idwizyty`, `idlekarza`, `idpacjenta`, `idpokoju`, `czas_trwania`, `idterminu`, `idoferty`) VALUES
(8, 1, 3, 5, '15 minut', 8, 3),
(9, 5, 2, 2, '5 minut', 7, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `gabinety`
--
ALTER TABLE `gabinety`
  ADD PRIMARY KEY (`idpokoju`);

--
-- Indeksy dla tabeli `kalendarz_pacjenta`
--
ALTER TABLE `kalendarz_pacjenta`
  ADD PRIMARY KEY (`idkalendarz`),
  ADD KEY `idwizyty` (`idwizyty`);

--
-- Indeksy dla tabeli `kalendarz_pracownika`
--
ALTER TABLE `kalendarz_pracownika`
  ADD PRIMARY KEY (`idzadania`),
  ADD UNIQUE KEY `idterminu` (`idterminu`);

--
-- Indeksy dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD PRIMARY KEY (`idlekarza`),
  ADD KEY `idpracownika` (`idpracownika`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`idleku`);

--
-- Indeksy dla tabeli `logowanie`
--
ALTER TABLE `logowanie`
  ADD PRIMARY KEY (`idlogowania`);

--
-- Indeksy dla tabeli `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`idoferty`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`idpacjenta`),
  ADD KEY `idlogowania` (`idlogowania`),
  ADD KEY `idlogowania_2` (`idlogowania`);

--
-- Indeksy dla tabeli `platnosci`
--
ALTER TABLE `platnosci`
  ADD PRIMARY KEY (`idplatnosci`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`idpracownika`),
  ADD KEY `idlogowania` (`idlogowania`);

--
-- Indeksy dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD PRIMARY KEY (`idurzadzenia`),
  ADD KEY `idpokoju` (`idpokoju`);

--
-- Indeksy dla tabeli `terminy`
--
ALTER TABLE `terminy`
  ADD PRIMARY KEY (`idterminu`);

--
-- Indeksy dla tabeli `wizyty_zrealizowane`
--
ALTER TABLE `wizyty_zrealizowane`
  ADD PRIMARY KEY (`id_z_wizyty`),
  ADD KEY `idwizyty` (`idwizyty`,`idleku`,`idplatnosci`),
  ADD KEY `idleku` (`idleku`),
  ADD KEY `idplatnosci` (`idplatnosci`);

--
-- Indeksy dla tabeli `zapis_na_wizyte`
--
ALTER TABLE `zapis_na_wizyte`
  ADD PRIMARY KEY (`idwizyty`),
  ADD KEY `a` (`idlekarza`),
  ADD KEY `idpacjenta` (`idpacjenta`,`idpokoju`,`idterminu`,`idoferty`),
  ADD KEY `idoferty` (`idoferty`),
  ADD KEY `idpokoju` (`idpokoju`),
  ADD KEY `idterminu` (`idterminu`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `gabinety`
--
ALTER TABLE `gabinety`
  MODIFY `idpokoju` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `kalendarz_pacjenta`
--
ALTER TABLE `kalendarz_pacjenta`
  MODIFY `idkalendarz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT dla tabeli `kalendarz_pracownika`
--
ALTER TABLE `kalendarz_pracownika`
  MODIFY `idzadania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `idleku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `logowanie`
--
ALTER TABLE `logowanie`
  MODIFY `idlogowania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT dla tabeli `oferta`
--
ALTER TABLE `oferta`
  MODIFY `idoferty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `idpacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `platnosci`
--
ALTER TABLE `platnosci`
  MODIFY `idplatnosci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `idpracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  MODIFY `idurzadzenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `terminy`
--
ALTER TABLE `terminy`
  MODIFY `idterminu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `wizyty_zrealizowane`
--
ALTER TABLE `wizyty_zrealizowane`
  MODIFY `id_z_wizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `zapis_na_wizyte`
--
ALTER TABLE `zapis_na_wizyte`
  MODIFY `idwizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `kalendarz_pacjenta`
--
ALTER TABLE `kalendarz_pacjenta`
  ADD CONSTRAINT `kalendarz_pacjenta_ibfk_1` FOREIGN KEY (`idwizyty`) REFERENCES `zapis_na_wizyte` (`idwizyty`);

--
-- Ograniczenia dla tabeli `kalendarz_pracownika`
--
ALTER TABLE `kalendarz_pracownika`
  ADD CONSTRAINT `kalendarz_pracownika_ibfk_1` FOREIGN KEY (`idterminu`) REFERENCES `terminy` (`idterminu`);

--
-- Ograniczenia dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD CONSTRAINT `lekarze_ibfk_2` FOREIGN KEY (`idpracownika`) REFERENCES `pracownicy` (`idpracownika`);

--
-- Ograniczenia dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD CONSTRAINT `pacjenci_ibfk_1` FOREIGN KEY (`idlogowania`) REFERENCES `logowanie` (`idlogowania`);

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_2` FOREIGN KEY (`idlogowania`) REFERENCES `logowanie` (`idlogowania`);

--
-- Ograniczenia dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD CONSTRAINT `sprzet_ibfk_1` FOREIGN KEY (`idpokoju`) REFERENCES `gabinety` (`idpokoju`);

--
-- Ograniczenia dla tabeli `wizyty_zrealizowane`
--
ALTER TABLE `wizyty_zrealizowane`
  ADD CONSTRAINT `wizyty_zrealizowane_ibfk_1` FOREIGN KEY (`idleku`) REFERENCES `leki` (`idleku`),
  ADD CONSTRAINT `wizyty_zrealizowane_ibfk_2` FOREIGN KEY (`idplatnosci`) REFERENCES `platnosci` (`idplatnosci`),
  ADD CONSTRAINT `wizyty_zrealizowane_ibfk_3` FOREIGN KEY (`idwizyty`) REFERENCES `zapis_na_wizyte` (`idwizyty`);

--
-- Ograniczenia dla tabeli `zapis_na_wizyte`
--
ALTER TABLE `zapis_na_wizyte`
  ADD CONSTRAINT `zapis_na_wizyte_ibfk_2` FOREIGN KEY (`idoferty`) REFERENCES `oferta` (`idoferty`),
  ADD CONSTRAINT `zapis_na_wizyte_ibfk_3` FOREIGN KEY (`idpokoju`) REFERENCES `gabinety` (`idpokoju`),
  ADD CONSTRAINT `zapis_na_wizyte_ibfk_4` FOREIGN KEY (`idterminu`) REFERENCES `terminy` (`idterminu`),
  ADD CONSTRAINT `zapis_na_wizyte_ibfk_5` FOREIGN KEY (`idpacjenta`) REFERENCES `pacjenci` (`idpacjenta`),
  ADD CONSTRAINT `zapis_na_wizyte_ibfk_6` FOREIGN KEY (`idlekarza`) REFERENCES `lekarze` (`idlekarza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
