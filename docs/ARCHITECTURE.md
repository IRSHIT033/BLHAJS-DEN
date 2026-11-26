# Architecture

A one-page map of the project. It describes the code as it is now; update it when that changes.

## What the site is
Blahaj's Den is a static-style site about sharks, with a small PHP + MySQL "Join us" sign-up.

## Pages
| Page | File | What it does |
|---|---|---|
| Home | `index.php` | Navbar, "Save the sharks" hero, the "Evolve Blåhaj" mini-game, Shark-wiki cards (blue shark, reef shark, hammerhead), and a footer link to Join us. Plain HTML; no PHP code runs in it. |
| Join us | `shark/join.php` | Bootstrap 5 page with a sign-up form (in a modal) and the 5 newest sign-ups read from the database. The Donate button shows "Coming soon". |
| Form handler | `shark/backend.php` | Receives the POSTed form, inserts a row into `joinus`, then redirects back to `join.php`. |

## Front-end scripts (`js/`)
- `blajah.js`: the Evolve game. Hovering rotates a GIF; clicking hides the GIFs, plays `dancin.mpeg`, and shows the dancing shark.
- `hamburger.js`: toggles the mobile nav menu.
- `tilt.js`: third-party jQuery Tilt plugin, used for card hover effects (jQuery is loaded from Google's CDN).

## Styles
- `css/style.css`: home page.
- `css/backendstyle.css`: Join us page (on top of Bootstrap).

## Data
- MySQL database `shark`, table `joinus`: `id`, `name`, `email`, `description`, `description1`, `datetime`.
- `joinus.sql` is a phpMyAdmin dump that creates the table (it also includes 2 sample rows).
- PHP connects as `root` with an empty password on `localhost` (local XAMPP-style setup).

## Assets
- `images/`: shark photos and GIFs. `shark/shark.png`: avatar on sign-up cards. `dancin.mpeg`: game audio.

## Known issues
- **SQL injection:** `shark/backend.php` puts form values straight into the SQL string. It should use prepared statements.
- `index.php` loads `js/app.js`, but that file doesn't exist.
- The home navbar's "Join Us" link goes to `join-us` (a missing page) instead of `#join-us` or `shark/join.php`.
- `blajah.js` loads audio from `../dancin.mpeg`, which is the wrong path from `index.php` at the repo root.
- Database credentials are hard-coded in two PHP files.
