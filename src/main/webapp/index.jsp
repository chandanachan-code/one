<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="[fonts.googleapis.com](https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700&family=Poppins:wght@600;700;800&display=swap)" rel="stylesheet">
    <link rel="stylesheet" href="[cdnjs.cloudflare.com](https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css)" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        /* ============ RESET & VARIABLES ============ */
        :root {
            --bg: #fafbfc;
            --surface: #ffffff;
            --primary: #111827;
            --primary-soft: #1f2937;
            --accent: #6366f1;
            --accent-soft: #e0e7ff;
            --accent-glow: rgba(99, 102, 241, 0.15);
            --muted: #6b7280;
            --muted-light: #9ca3af;
            --border: #e5e7eb;
            --border-light: #f3f4f6;
            --danger: #ef4444;
            --success: #10b981;
            --warning: #f59e0b;
            --star: #fbbf24;
            --radius-sm: 8px;
            --radius: 14px;
            --radius-lg: 20px;
            --radius-xl: 28px;
            --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.04);
            --shadow: 0 1px 3px rgba(0, 0, 0, 0.06), 0 4px 12px rgba(0, 0, 0, 0.04);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.05), 0 10px 30px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 20px 50px rgba(0, 0, 0, 0.08), 0 8px 20px rgba(0, 0, 0, 0.04);
            --container: 1240px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        }

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        html { scroll-behavior: smooth; scroll-padding-top: 80px; }
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            color: var(--primary);
            background: var(--bg);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            line-height: 1.6;
            min-height: 100vh;
        }
        img { display: block; max-width: 100%; }
        a { color: inherit; text-decoration: none; }
        button { font-family: inherit; cursor: pointer; border: none; }
        ul { list-style: none; }
        input { font-family: inherit; }

        .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 24px; }

        /* ============ TOAST ============ */
        .toast-container {
            position: fixed; bottom: 32px; right: 32px; z-index: 9999;
            display: flex; flex-direction: column; gap: 10px; pointer-events: none;
        }
        .toast {
            background: var(--primary); color: #fff; padding: 14px 20px;
            border-radius: var(--radius-sm); font-weight: 500; font-size: 14px;
            box-shadow: var(--shadow-lg); pointer-events: auto;
            animation: slideUp 0.35s ease, fadeOut 0.3s ease 2.2s forwards;
            display: flex; align-items: center; gap: 10px; max-width: 380px;
        }
        .toast.success { border-left: 4px solid var(--success); }
        .toast i { font-size: 16px; }
        @keyframes slideUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeOut { to { opacity: 0; transform: translateY(-10px); } }

        /* ============ HEADER ============ */
        .site-header {
            position: sticky; top: 0; z-index: 100;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px) saturate(180%);
            -webkit-backdrop-filter: blur(16px) saturate(180%);
            border-bottom: 1px solid var(--border-light);
            transition: var(--transition);
        }
        .site-header.scrolled { box-shadow: var(--shadow); }
        .header-row {
            display: flex; align-items: center; gap: 20px;
            padding: 12px 0; min-height: 64px;
        }
        .brand {
            display: flex; align-items: center; gap: 10px;
            font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 22px;
            color: var(--primary); flex-shrink: 0;
            letter-spacing: -0.02em;
        }
        .brand-dot { width: 10px; height: 10px; border-radius: 50%; background: var(--accent); }
        .brand .accent-text { color: var(--accent); }

        /* Search */
        .search-wrapper {
            flex: 1; max-width: 480px; position: relative;
        }
        .search-box {
            display: flex; align-items: center; background: var(--bg);
            border: 2px solid transparent; border-radius: 999px;
            padding: 4px 4px 4px 18px; transition: var(--transition);
            gap: 6px;
        }
        .search-box:focus-within {
            border-color: var(--accent); background: var(--surface);
            box-shadow: 0 0 0 4px var(--accent-glow);
        }
        .search-box input {
            border: 0; background: transparent; outline: none; width: 100%;
            font-size: 14px; color: var(--primary); padding: 8px 0;
        }
        .search-box input::placeholder { color: var(--muted-light); }
        .search-box .search-btn {
            background: var(--accent); color: #fff; width: 38px; height: 38px;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            font-size: 15px; flex-shrink: 0; transition: var(--transition);
        }
        .search-box .search-btn:hover { background: #4f46e5; }
        .search-clear { display: none; background: none; color: var(--muted-light); padding: 4px 8px; font-size: 14px; }

        /* Nav */
        .main-nav { display: flex; align-items: center; gap: 6px; flex-shrink: 0; }
        .main-nav a {
            padding: 8px 14px; border-radius: var(--radius-sm); font-weight: 500;
            font-size: 14px; color: var(--primary-soft); transition: var(--transition);
            display: flex; align-items: center; gap: 6px; white-space: nowrap;
        }
        .main-nav a:hover, .main-nav a.active { background: var(--accent-soft); color: var(--accent); }
        .main-nav a i { font-size: 13px; }

        /* Header actions */
        .header-actions { display: flex; align-items: center; gap: 8px; flex-shrink: 0; }
        .icon-btn {
            width: 40px; height: 40px; border-radius: 50%; display: flex;
            align-items: center; justify-content: center; font-size: 18px;
            background: transparent; color: var(--primary-soft); transition: var(--transition); position: relative;
        }
        .icon-btn:hover { background: var(--bg); color: var(--accent); }

        /* Cart button */
        .cart-btn {
            display: flex; align-items: center; gap: 8px;
            background: var(--primary); color: #fff; padding: 8px 16px 8px 12px;
            border-radius: 999px; font-weight: 600; font-size: 14px; transition: var(--transition);
        }
        .cart-btn:hover { background: var(--primary-soft); transform: translateY(-1px); }
        .cart-badge {
            background: var(--accent); color: #fff; font-size: 11px; font-weight: 700;
            min-width: 20px; height: 20px; border-radius: 50%; display: flex;
            align-items: center; justify-content: center; padding: 0 5px;
        }
        .cart-badge.bump { animation: bump 0.3s ease; }
        @keyframes bump { 0%,100% { transform: scale(1); } 50% { transform: scale(1.4); } }

        .mobile-toggle {
            display: none; background: none; font-size: 22px; color: var(--primary);
            width: 40px; height: 40px; align-items: center; justify-content: center;
            border-radius: var(--radius-sm);
        }

        /* Mobile menu */
        .mobile-menu {
            display: none; background: var(--surface); border-top: 1px solid var(--border-light);
            padding: 8px 0; animation: slideDown 0.25s ease;
        }
        .mobile-menu.open { display: block; }
        .mobile-menu a {
            display: flex; align-items: center; gap: 10px; padding: 12px 24px;
            font-weight: 500; font-size: 15px; transition: var(--transition);
        }
        .mobile-menu a:hover { background: var(--accent-soft); color: var(--accent); }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-8px); } to { opacity: 1; transform: translateY(0); } }

        /* ============ HERO ============ */
        .hero {
            position: relative; overflow: hidden;
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 40%, #312e81 100%);
            color: #fff; min-height: 480px; display: flex; align-items: center;
            border-radius: 0 0 var(--radius-xl) var(--radius-xl); margin-bottom: 16px;
        }
        .hero::before {
            content: ''; position: absolute; inset: 0;
            background: radial-gradient(ellipse at 30% 50%, rgba(99, 102, 241, 0.25) 0%, transparent 60%),
                        radial-gradient(ellipse at 70% 20%, rgba(168, 85, 247, 0.15) 0%, transparent 50%);
        }
        .hero-pattern {
            position: absolute; inset: 0; opacity: 0.04;
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='[w3.org](http://www.w3.org/2000/svg)'%3E%3Cg fill='%23fff'%3E%3Ccircle cx='30' cy='30' r='1.2'/%3E%3C/g%3E%3C/svg%3E");
        }
        .hero-content { position: relative; z-index: 1; padding: 64px 0; max-width: 680px; }
        .hero-badge {
            display: inline-flex; align-items: center; gap: 8px;
            background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.15);
            padding: 6px 16px; border-radius: 999px; font-size: 13px; font-weight: 500;
            margin-bottom: 20px; backdrop-filter: blur(4px);
        }
        .hero-badge .pulse-dot { width: 8px; height: 8px; border-radius: 50%; background: #22c55e; animation: pulse 2s infinite; }
        @keyframes pulse { 0%,100% { opacity: 1; } 50% { opacity: 0.4; } }
        .hero h1 {
            font-family: 'Poppins', sans-serif; font-size: clamp(32px, 5vw, 52px);
            font-weight: 800; line-height: 1.15; margin-bottom: 16px; letter-spacing: -0.03em;
        }
        .hero h1 .highlight { background: linear-gradient(135deg, #a5b4fc, #c4b5fd); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .hero p { font-size: 17px; opacity: 0.85; max-width: 520px; margin-bottom: 28px; line-height: 1.7; }
        .hero-actions { display: flex; gap: 12px; flex-wrap: wrap; }
        .btn {
            display: inline-flex; align-items: center; gap: 8px; padding: 13px 24px;
            border-radius: 999px; font-weight: 600; font-size: 15px; transition: var(--transition);
            white-space: nowrap; letter-spacing: -0.01em;
        }
        .btn-primary {
            background: var(--accent); color: #fff;
            box-shadow: 0 4px 16px rgba(99, 102, 241, 0.35);
        }
        .btn-primary:hover { background: #4f46e5; transform: translateY(-2px); box-shadow: 0 8px 25px rgba(99, 102, 241, 0.45); }
        .btn-outline {
            background: transparent; border: 2px solid rgba(255, 255, 255, 0.25); color: #fff;
        }
        .btn-outline:hover { background: rgba(255, 255, 255, 0.08); border-color: rgba(255, 255, 255, 0.45); }
        .btn-sm { padding: 8px 16px; font-size: 13px; }
        .btn-block { width: 100%; justify-content: center; }

        /* ============ SECTION HEADERS ============ */
        .section { padding: 56px 0; }
        .section-header { text-align: center; margin-bottom: 36px; }
        .section-header h2 {
            font-family: 'Poppins', sans-serif; font-size: clamp(24px, 3vw, 30px);
            font-weight: 700; letter-spacing: -0.02em; margin-bottom: 8px;
        }
        .section-header p { color: var(--muted); font-size: 15px; max-width: 500px; margin: 0 auto; }
        .section-header .section-tag {
            display: inline-block; background: var(--accent-soft); color: var(--accent);
            padding: 4px 12px; border-radius: 999px; font-size: 12px; font-weight: 600;
            text-transform: uppercase; letter-spacing: 0.04em; margin-bottom: 12px;
        }

        /* ============ CATEGORIES ============ */
        .category-grid {
            display: grid; grid-template-columns: repeat(6, 1fr); gap: 16px;
        }
        .cat-card {
            background: var(--surface); border-radius: var(--radius); padding: 24px 16px;
            text-align: center; cursor: pointer; transition: var(--transition-slow);
            border: 1px solid var(--border-light); position: relative; overflow: hidden;
        }
        .cat-card::before {
            content: ''; position: absolute; inset: 0; background: var(--accent);
            opacity: 0; transition: var(--transition-slow); border-radius: var(--radius);
        }
        .cat-card:hover { transform: translateY(-6px); box-shadow: var(--shadow-lg); border-color: transparent; }
        .cat-card:hover::before { opacity: 0.03; }
        .cat-card .cat-icon {
            width: 56px; height: 56px; border-radius: var(--radius-sm);
            background: var(--accent-soft); color: var(--accent); margin: 0 auto 12px;
            display: flex; align-items: center; justify-content: center; font-size: 24px;
            transition: var(--transition-slow); position: relative; z-index: 1;
        }
        .cat-card:hover .cat-icon { background: var(--accent); color: #fff; transform: scale(1.08); }
        .cat-card h4 { font-size: 14px; font-weight: 600; position: relative; z-index: 1; }
        .cat-card .cat-count { font-size: 12px; color: var(--muted-light); margin-top: 4px; position: relative; z-index: 1; }

        /* ============ TOOLBAR ============ */
        .toolbar { display: flex; align-items: center; justify-content: space-between; gap: 16px; margin-bottom: 24px; flex-wrap: wrap; }
        .toolbar-tabs { display: flex; gap: 4px; background: var(--border-light); padding: 4px; border-radius: 999px; }
        .toolbar-tab {
            padding: 8px 18px; border-radius: 999px; font-size: 13px; font-weight: 600;
            background: transparent; color: var(--muted); transition: var(--transition);
        }
        .toolbar-tab.active { background: var(--surface); color: var(--primary); box-shadow: var(--shadow-sm); }
        .toolbar-right { display: flex; align-items: center; gap: 10px; }
        .sort-select {
            padding: 8px 14px; border-radius: 999px; border: 1px solid var(--border);
            font-size: 13px; font-weight: 500; background: var(--surface); color: var(--primary);
            outline: none; cursor: pointer; font-family: inherit;
        }
        .sort-select:focus { border-color: var(--accent); box-shadow: 0 0 0 3px var(--accent-glow); }
        .result-count { font-size: 13px; color: var(--muted); }

        /* ============ PRODUCT GRID ============ */
        .product-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
        .product-card {
            background: var(--surface); border-radius: var(--radius); overflow: hidden;
            border: 1px solid var(--border-light); transition: var(--transition-slow);
            display: flex; flex-direction: column; position: relative;
        }
        .product-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-lg); border-color: transparent; }
        .product-img-wrap {
            position: relative; overflow: hidden; aspect-ratio: 1 / 1; background: #f9fafb;
        }
        .product-img-wrap img {
            width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease;
        }
        .product-card:hover .product-img-wrap img { transform: scale(1.06); }
        .product-badge {
            position: absolute; top: 12px; left: 12px; z-index: 2;
            padding: 4px 10px; border-radius: 999px; font-size: 11px; font-weight: 700;
            letter-spacing: 0.02em;
        }
        .badge-new { background: var(--success); color: #fff; }
        .badge-sale { background: var(--danger); color: #fff; }
        .badge-trend { background: var(--warning); color: #000; }
        .product-actions-overlay {
            position: absolute; top: 12px; right: 12px; z-index: 2;
            display: flex; flex-direction: column; gap: 6px;
            opacity: 0; transform: translateX(8px); transition: var(--transition-slow);
        }
        .product-card:hover .product-actions-overlay { opacity: 1; transform: translateX(0); }
        .product-actions-overlay button {
            width: 36px; height: 36px; border-radius: 50%; background: var(--surface);
            color: var(--primary-soft); font-size: 15px; display: flex; align-items: center;
            justify-content: center; box-shadow: var(--shadow); transition: var(--transition);
        }
        .product-actions-overlay button:hover { background: var(--accent); color: #fff; }
        .product-actions-overlay button.wishlisted { background: #fecaca; color: var(--danger); }
        .product-body { padding: 16px; flex: 1; display: flex; flex-direction: column; gap: 8px; }
        .product-body .product-category { font-size: 11px; color: var(--muted-light); text-transform: uppercase; letter-spacing: 0.05em; font-weight: 600; }
        .product-body h5 { font-size: 15px; font-weight: 600; line-height: 1.3; }
        .product-rating { display: flex; align-items: center; gap: 6px; font-size: 13px; }
        .product-rating .stars { color: var(--star); letter-spacing: 1px; }
        .product-rating .count { color: var(--muted-light); }
        .product-price-row { display: flex; align-items: baseline; gap: 8px; margin-top: auto; }
        .product-price { font-size: 18px; font-weight: 700; color: var(--primary); }
        .product-old-price { font-size: 13px; color: var(--muted-light); text-decoration: line-through; }
        .product-footer { padding: 12px 16px 16px; display: flex; gap: 8px; }
        .add-to-cart-btn {
            flex: 1; padding: 10px; border-radius: var(--radius-sm); font-weight: 600;
            font-size: 13px; background: var(--primary); color: #fff; transition: var(--transition);
            display: flex; align-items: center; justify-content: center; gap: 6px;
        }
        .add-to-cart-btn:hover { background: var(--primary-soft); }
        .add-to-cart-btn.added { background: var(--success); }

        /* ============ DEAL SECTION ============ */
        .deal-card {
            display: flex; background: var(--surface); border-radius: var(--radius-lg);
            overflow: hidden; border: 1px solid var(--border-light); box-shadow: var(--shadow);
        }
        .deal-card .deal-img {
            width: 48%; min-height: 380px; object-fit: cover; flex-shrink: 0;
        }
        .deal-body { padding: 36px; display: flex; flex-direction: column; justify-content: center; flex: 1; }
        .deal-body .deal-tag { display: inline-block; background: #fef2f2; color: var(--danger); padding: 4px 12px; border-radius: 999px; font-size: 12px; font-weight: 700; margin-bottom: 16px; width: fit-content; }
        .deal-body h3 { font-family: 'Poppins', sans-serif; font-size: 26px; font-weight: 700; margin-bottom: 8px; }
        .deal-body > p { color: var(--muted); margin-bottom: 20px; }
        .countdown { display: flex; gap: 10px; margin-bottom: 24px; }
        .countdown-unit {
            background: var(--bg); border-radius: var(--radius-sm); padding: 14px 18px;
            text-align: center; min-width: 70px;
        }
        .countdown-unit .count-num { font-size: 26px; font-weight: 700; font-family: 'Poppins', sans-serif; line-height: 1; }
        .countdown-unit .count-label { font-size: 11px; color: var(--muted-light); text-transform: uppercase; letter-spacing: 0.04em; margin-top: 4px; }
        .deal-price-area { display: flex; align-items: center; gap: 12px; margin-bottom: 8px; }
        .deal-price { font-size: 30px; font-weight: 700; }
        .deal-old-price { font-size: 16px; color: var(--muted-light); text-decoration: line-through; }
        .deal-save { background: #fef2f2; color: var(--danger); padding: 6px 12px; border-radius: 999px; font-size: 13px; font-weight: 700; }
        .deal-stock { font-size: 13px; color: var(--muted); margin-bottom: 20px; }
        .deal-stock strong { color: var(--danger); }
        .stock-bar { height: 6px; background: var(--border-light); border-radius: 999px; margin-bottom: 20px; overflow: hidden; }
        .stock-bar-fill { height: 100%; background: var(--danger); border-radius: 999px; width: 18%; transition: width 0.5s ease; }

        /* ============ TESTIMONIALS ============ */
        .testimonial-scroll {
            display: flex; gap: 20px; overflow-x: auto; padding: 8px 4px 20px;
            scroll-snap-type: x mandatory; -webkit-overflow-scrolling: touch;
        }
        .testimonial-scroll::-webkit-scrollbar { height: 6px; }
        .testimonial-scroll::-webkit-scrollbar-track { background: var(--border-light); border-radius: 999px; }
        .testimonial-scroll::-webkit-scrollbar-thumb { background: var(--border); border-radius: 999px; }
        .testimonial-card {
            min-width: 340px; scroll-snap-align: start;
            background: var(--surface); border-radius: var(--radius); padding: 24px;
            border: 1px solid var(--border-light); box-shadow: var(--shadow-sm);
        }
        .testimonial-card .quote-icon { color: var(--accent-soft); font-size: 32px; margin-bottom: 12px; }
        .testimonial-card p { font-size: 15px; line-height: 1.7; color: var(--primary-soft); margin-bottom: 16px; }
        .testimonial-card .author { display: flex; align-items: center; gap: 12px; }
        .testimonial-card .author img { width: 44px; height: 44px; border-radius: 50%; object-fit: cover; }
        .testimonial-card .author .author-name { font-weight: 600; font-size: 14px; }
        .testimonial-card .author .author-tag { font-size: 12px; color: var(--muted-light); }
        .testimonial-card .stars { color: var(--star); font-size: 14px; margin-bottom: 8px; }

        /* ============ NEWSLETTER ============ */
        .newsletter {
            background: linear-gradient(135deg, #0f172a, #1e1b4b);
            border-radius: var(--radius-lg); padding: 52px 40px; text-align: center;
            color: #fff; position: relative; overflow: hidden;
        }
        .newsletter::before {
            content: ''; position: absolute; inset: 0;
            background: radial-gradient(ellipse at 50% 50%, rgba(99, 102, 241, 0.2) 0%, transparent 70%);
        }
        .newsletter-content { position: relative; z-index: 1; }
        .newsletter h3 { font-family: 'Poppins', sans-serif; font-size: 26px; font-weight: 700; margin-bottom: 8px; }
        .newsletter p { opacity: 0.8; margin-bottom: 24px; font-size: 15px; }
        .newsletter-form { display: flex; gap: 8px; max-width: 480px; margin: 0 auto; justify-content: center; flex-wrap: wrap; }
        .newsletter-form input {
            flex: 1; min-width: 240px; padding: 14px 20px; border-radius: 999px;
            border: 2px solid rgba(255, 255, 255, 0.15); background: rgba(255, 255, 255, 0.06);
            color: #fff; font-size: 14px; outline: none; transition: var(--transition);
        }
        .newsletter-form input::placeholder { color: rgba(255, 255, 255, 0.4); }
        .newsletter-form input:focus { border-color: var(--accent); background: rgba(255, 255, 255, 0.1); }
        .newsletter-form .btn-primary { padding: 14px 28px; }
        .newsletter-msg { margin-top: 14px; font-size: 13px; min-height: 20px; }

        /* ============ QUICK VIEW MODAL ============ */
        .modal-overlay {
            position: fixed; inset: 0; z-index: 200; background: rgba(0,0,0,0.5);
            display: flex; align-items: center; justify-content: center; padding: 24px;
            animation: fadeIn 0.2s ease; opacity: 0; pointer-events: none; transition: opacity 0.2s ease;
        }
        .modal-overlay.open { opacity: 1; pointer-events: auto; }
        .modal {
            background: var(--surface); border-radius: var(--radius-lg); max-width: 560px;
            width: 100%; padding: 32px; position: relative; max-height: 90vh; overflow-y: auto;
            box-shadow: var(--shadow-lg); animation: modalSlide 0.3s ease;
        }
        @keyframes modalSlide { from { transform: translateY(20px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
        .modal-close {
            position: absolute; top: 16px; right: 16px; width: 36px; height: 36px;
            border-radius: 50%; background: var(--bg); display: flex; align-items: center;
            justify-content: center; font-size: 16px; color: var(--muted); transition: var(--transition);
        }
        .modal-close:hover { background: #fee2e2; color: var(--danger); }
        .modal img { width: 100%; border-radius: var(--radius); margin-bottom: 20px; max-height: 300px; object-fit: cover; }
        .modal h3 { font-family: 'Poppins', sans-serif; font-size: 22px; margin-bottom: 8px; }
        .modal .modal-price { font-size: 24px; font-weight: 700; margin-bottom: 12px; }
        .modal .modal-desc { color: var(--muted); font-size: 14px; line-height: 1.7; margin-bottom: 20px; }

        /* ============ FOOTER ============ */
        .site-footer {
            background: var(--surface); border-top: 1px solid var(--border-light);
            padding: 48px 0 24px; margin-top: 32px;
        }
        .footer-grid { display: flex; gap: 48px; flex-wrap: wrap; }
        .footer-brand { max-width: 300px; }
        .footer-brand .brand { margin-bottom: 12px; }
        .footer-brand p { color: var(--muted); font-size: 14px; line-height: 1.7; }
        .footer-links { display: flex; gap: 48px; flex-wrap: wrap; flex: 1; justify-content: flex-end; }
        .footer-col h4 { font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 14px; color: var(--primary-soft); }
        .footer-col ul { display: flex; flex-direction: column; gap: 8px; }
        .footer-col ul a { font-size: 14px; color: var(--muted); transition: var(--transition); }
        .footer-col ul a:hover { color: var(--accent); }
        .social-links { display: flex; gap: 8px; margin-top: 16px; }
        .social-links a {
            width: 36px; height: 36px; border-radius: 50%; background: var(--bg);
            display: flex; align-items: center; justify-content: center;
            color: var(--muted); font-size: 16px; transition: var(--transition);
        }
        .social-links a:hover { background: var(--accent); color: #fff; }
        .footer-bottom { border-top: 1px solid var(--border-light); margin-top: 36px; padding-top: 20px; text-align: center; font-size: 13px; color: var(--muted-light); }

        /* ============ RESPONSIVE ============ */
        @media (max-width: 1100px) {
            .category-grid { grid-template-columns: repeat(3, 1fr); }
            .product-grid { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 900px) {
            .main-nav, .search-wrapper { display: none; }
            .mobile-toggle { display: flex; }
            .header-row { gap: 12px; }
            .product-grid { grid-template-columns: repeat(2, 1fr); }
            .deal-card { flex-direction: column; }
            .deal-card .deal-img { width: 100%; min-height: 240px; max-height: 280px; }
            .deal-body { padding: 24px; }
            .countdown-unit { min-width: 56px; padding: 10px 12px; }
            .countdown-unit .count-num { font-size: 20px; }
            .category-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 600px) {
            .container { padding: 0 16px; }
            .hero { min-height: 400px; border-radius: 0 0 var(--radius-lg) var(--radius-lg); }
            .hero-content { padding: 40px 0; }
            .product-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
            .category-grid { grid-template-columns: repeat(2, 1fr); gap: 10px; }
            .cat-card { padding: 16px 10px; }
            .cat-card .cat-icon { width: 44px; height: 44px; font-size: 20px; }
            .newsletter { padding: 36px 20px; }
            .newsletter-form input { min-width: 100%; }
            .toolbar { flex-direction: column; align-items: flex-start; }
            .footer-grid { flex-direction: column; gap: 32px; }
            .footer-links { justify-content: flex-start; gap: 28px; }
            .testimonial-card { min-width: 280px; }
            .btn { padding: 11px 20px; font-size: 14px; }
        }

        /* ============ UTILITY ============ */
        .sr-only { position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(0,0,0,0); white-space: nowrap; border: 0; }
        .text-muted { color: var(--muted); }
        .empty-state { text-align: center; padding: 48px 20px; color: var(--muted); }
        .empty-state i { font-size: 48px; margin-bottom: 16px; display: block; color: var(--border); }
    </style>
</head>

<body>
    <!-- Toast Container -->
    <div class="toast-container" id="toastContainer" aria-live="polite"></div>

    <!-- Quick View Modal -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal" id="modalContent" role="dialog" aria-modal="true" aria-labelledby="modalTitle"></div>
    </div>

    <!-- Header -->
    <header class="site-header" id="siteHeader" role="banner">
        <div class="container">
            <div class="header-row">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu" aria-expanded="false">
                    <i class="fas fa-bars"></i>
                </button>

                <a class="brand" href="#" aria-label="NexusShop home">
                    <span class="brand-dot"></span>Nexus<span class="accent-text">Shop</span>
                </a>

                <div class="search-wrapper" role="search">
                    <div class="search-box">
                        <i class="fas fa-search text-muted" style="font-size:14px"></i>
                        <input type="search" id="searchInput" placeholder="Search products, categories..." aria-label="Search products" autocomplete="off" />
                        <button class="search-clear" id="searchClear" aria-label="Clear search"><i class="fas fa-times"></i></button>
                        <button class="search-btn" id="searchBtn" aria-label="Search"><i class="fas fa-search"></i></button>
                    </div>
                </div>

                <nav class="main-nav" aria-label="Primary navigation">
                    <a href="#" class="active"><i class="fas fa-home"></i> Home</a>
                    <a href="#categories"><i class="fas fa-th-large"></i> Categories</a>
                    <a href="#deals"><i class="fas fa-tag"></i> Deals</a>
                    <a href="#about"><i class="fas fa-info-circle"></i> About</a>
                </nav>

                <div class="header-actions">
                    <button class="icon-btn" aria-label="Wishlist" id="wishlistBtn"><i class="far fa-heart"></i></button>
                    <button class="cart-btn" id="cartBtn" aria-label="View cart">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Cart</span>
                        <span class="cart-badge" id="cartCount">0</span>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile menu -->
        <div class="mobile-menu" id="mobileMenu" aria-label="Mobile navigation">
            <nav>
                <a href="#">🏠 Home</a>
                <a href="#categories">📂 Categories</a>
                <a href="#deals">🏷️ Deals</a>
                <a href="#about">ℹ️ About</a>
            </nav>
        </div>
    </header>

    <main>
        <!-- Hero -->
        <section class="hero" role="banner" aria-label="Hero banner">
            <div class="hero-pattern"></div>
            <div class="container">
                <div class="hero-content">
                    <div class="hero-badge">
                        <span class="pulse-dot"></span> New collection is live
                    </div>
                    <h1>Discover the <span class="highlight">Winter Collection</span></h1>
                    <p>Curated fashion, tech, and accessories with exclusive deals you won't find anywhere else. Free shipping on orders over $99.</p>
                    <div class="hero-actions">
                        <button class="btn btn-primary" id="shopNow">
                            Shop Now <i class="fas fa-arrow-right"></i>
                        </button>
                        <button class="btn btn-outline" id="exploreDeals">
                            <i class="fas fa-percent"></i> View Deals
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="section container" id="categories" aria-labelledby="catHeading">
            <div class="section-header">
                <span class="section-tag">Browse</span>
                <h2 id="catHeading">Shop by Category</h2>
                <p>Explore our curated selection across popular categories</p>
            </div>
            <div class="category-grid" id="categoriesGrid" aria-live="polite"></div>
        </section>

        <!-- Products -->
        <section class="section container" id="products" aria-labelledby="prodHeading">
            <div class="section-header">
                <span class="section-tag">Trending</span>
                <h2 id="prodHeading">Popular Right Now</h2>
                <p>Most-loved picks based on what people are buying</p>
            </div>

            <div class="toolbar">
                <div class="toolbar-tabs" id="filterTabs" role="tablist" aria-label="Filter products">
                    <button class="toolbar-tab active" data-filter="all" role="tab" aria-selected="true">All</button>
                    <button class="toolbar-tab" data-filter="phones" role="tab" aria-selected="false">Phones</button>
                    <button class="toolbar-tab" data-filter="laptops" role="tab" aria-selected="false">Laptops</button>
                    <button class="toolbar-tab" data-filter="gadgets" role="tab" aria-selected="false">Gadgets</button>
                    <button class="toolbar-tab" data-filter="accessories" role="tab" aria-selected="false">Accessories</button>
                </div>
                <div class="toolbar-right">
                    <span class="result-count" id="resultCount"></span>
                    <select class="sort-select" id="sortSelect" aria-label="Sort products">
                        <option value="default">Sort: Featured</option>
                        <option value="price-asc">Price: Low → High</option>
                        <option value="price-desc">Price: High → Low</option>
                        <option value="rating">Top Rated</option>
                    </select>
                </div>
            </div>

            <div class="product-grid" id="productsGrid" aria-live="polite"></div>
            <div class="empty-state" id="emptyState" style="display:none">
                <i class="fas fa-search"></i>
                <p>No products match your search.</p>
                <button class="btn btn-primary btn-sm" id="clearSearch" style="margin-top:12px">Clear Search</button>
            </div>
        </section>

        <!-- Deals -->
        <section class="section container" id="deals" aria-labelledby="dealHeading">
            <div class="section-header">
                <span class="section-tag">Limited Time</span>
                <h2 id="dealHeading">Flash Sale</h2>
                <p>Grab these deals before they're gone</p>
            </div>

            <div class="deal-card">
                <img class="deal-img" src="[images.unsplash.com](https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1200&q=80)" alt="MacBook Air M2" loading="lazy" />
                <div class="deal-body">
                    <span class="deal-tag"><i class="fas fa-bolt"></i> Flash Deal</span>
                    <h3>MacBook Air M2</h3>
                    <p>Thin, light, and impossibly fast — powered by the next-generation M2 chip. Now at an unbeatable price.</p>

                    <div class="countdown" aria-label="Countdown timer" role="timer">
                        <div class="countdown-unit">
                            <div class="count-num" id="dealDays">0</div>
                            <div class="count-label">Days</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="count-num" id="dealHours">00</div>
                            <div class="count-label">Hours</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="count-num" id="dealMinutes">00</div>
                            <div class="count-label">Mins</div>
                        </div>
                        <div class="countdown-unit">
                            <div class="count-num" id="dealSeconds">00</div>
                            <div class="count-label">Secs</div>
                        </div>
                    </div>

                    <div class="deal-price-area">
                        <span class="deal-price">$999</span>
                        <span class="deal-old-price">$1,199</span>
                        <span class="deal-save">Save $200</span>
                    </div>

                    <p class="deal-stock">Only <strong>12</strong> items left at this price!</p>
                    <div class="stock-bar"><div class="stock-bar-fill" style="width:18%"></div></div>

                    <button class="btn btn-primary" id="buyDeal">
                        <i class="fas fa-shopping-cart"></i> Buy Now
                    </button>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="section container" aria-labelledby="testHeading">
            <div class="section-header">
                <span class="section-tag">Reviews</span>
                <h2 id="testHeading">Loved by Customers</h2>
                <p>Real feedback from real people</p>
            </div>

            <div class="testimonial-scroll" id="testimonials" aria-label="Customer testimonials">
                <div class="testimonial-card">
                    <div class="quote-icon"><i class="fas fa-quote-right"></i></div>
                    <div class="stars">★★★★★</div>
                    <p>"Incredible quality and lightning-fast shipping. The product exceeded every expectation I had — will definitely be a repeat customer."</p>
                    <div class="author">
                        <img src="[images.unsplash.com](https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80)" alt="Ava" loading="lazy" />
                        <div>
                            <div class="author-name">Ava Martin</div>
                            <div class="author-tag">Verified Buyer</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="quote-icon"><i class="fas fa-quote-right"></i></div>
                    <div class="stars">★★★★☆</div>
                    <p>"Great selection and the checkout process was buttery smooth. The packaging was top-notch too. Highly recommended."</p>
                    <div class="author">
                        <img src="[images.unsplash.com](https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80)" alt="Michael" loading="lazy" />
                        <div>
                            <div class="author-name">Michael Lee</div>
                            <div class="author-tag">Frequent Buyer</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="quote-icon"><i class="fas fa-quote-right"></i></div>
                    <div class="stars">★★★★★</div>
                    <p>"Customer support went above and beyond when I had a question. It's rare to find this level of service these days."</p>
                    <div class="author">
                        <img src="[images.unsplash.com](https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=80&q=80)" alt="Sophie" loading="lazy" />
                        <div>
                            <div class="author-name">Sophie Chen</div>
                            <div class="author-tag">Verified Buyer</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Newsletter -->
        <section class="section container" aria-labelledby="newsHeading">
            <div class="newsletter">
                <div class="newsletter-content">
                    <h3 id="newsHeading">✨ Stay in the Loop</h3>
                    <p>Be the first to know about exclusive drops, deals, and new arrivals.</p>
                    <form class="newsletter-form" id="newsletterForm" novalidate>
                        <input type="email" id="newsletterEmail" placeholder="Your email address" aria-label="Email address" required autocomplete="email" />
                        <button class="btn btn-primary" type="submit">Subscribe</button>
                    </form>
                    <div class="newsletter-msg" id="newsletterMsg" aria-live="polite"></div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="site-footer" id="about">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <div class="brand"><span class="brand-dot"></span>Nexus<span class="accent-text">Shop</span></div>
                    <p>A modern shopping experience designed with care. Quality products, fair prices, and real support.</p>
                    <div class="social-links">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-x-twitter"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="footer-links">
                    <div class="footer-col">
                        <h4>Shop</h4>
                        <ul>
                            <li><a href="#">All Products</a></li>
                            <li><a href="#">New Arrivals</a></li>
                            <li><a href="#">Best Sellers</a></li>
                            <li><a href="#">Sale</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Company</h4>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Press</a></li>
                            <li><a href="#">Blog</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Support</h4>
                        <ul>
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Shipping & Returns</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; <span id="year"></span> NexusShop. All rights reserved. &nbsp;·&nbsp;
                <a href="#" style="color:var(--muted-light)">Privacy Policy</a> &nbsp;·&nbsp;
                <a href="#" style="color:var(--muted-light)">Terms of Service</a>
            </div>
        </div>
    </footer>

    <script>
        (function() {
            // ──────────────── DATA ────────────────
            const CATEGORIES = [
                { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt', count: 24 },
                { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: 18 },
                { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt', count: 56 },
                { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones', count: 32 },
                { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints', count: 41 },
                { id: 'accessories', name: 'Accessories', icon: 'fa-watch', count: 67 }
            ];

            const PRODUCTS = [
                { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'sale', img: '[images.unsplash.com](https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80)', category: 'phones' },
                { id: 2, title: 'MacBook Pro 14"', price: 1999, oldPrice: null, rating: 4.5, reviews: 86, badge: 'new', img: '[images.unsplash.com](https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80)', category: 'laptops' },
                { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: 'sale', img: '[images.unsplash.com](https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
                { id: 4, title: 'Nike Air Max 270', price: 150, oldPrice: null, rating: 4, reviews: 53, badge: 'trend', img: '[images.unsplash.com](https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80)', category: 'footwear' },
                { id: 5, title: 'Sony A7 IV Camera', price: 2499, oldPrice: null, rating: 5, reviews: 42, badge: 'new', img: '[images.unsplash.com](https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80)', category: 'gadgets' },
                { id: 6, title: 'Chanel No. 5', price: 120, oldPrice: 150, rating: 5, reviews: 189, badge: 'trend', img: '[images.unsplash.com](https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
                { id: 7, title: 'Travel Backpack Pro', price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: 'sale', img: '[images.unsplash.com](https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
                { id: 8, title: 'Sony WH-1000XM5', price: 399, oldPrice: null, rating: 5, reviews: 156, badge: 'trend', img: '[images.unsplash.com](https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80)', category: 'gadgets' }
            ];

            // ──────────────── DOM REFS ────────────────
            const $ = (sel) => document.querySelector(sel);
            const $$ = (sel) => document.querySelectorAll(sel);

            const categoriesGrid = $('#categoriesGrid');
            const productsGrid = $('#productsGrid');
            const emptyState = $('#emptyState');
            const cartCountEl = $('#cartCount');
            const searchInput = $('#searchInput');
            const searchClear = $('#searchClear');
            const resultCount = $('#resultCount');
            const sortSelect = $('#sortSelect');
            const toastContainer = $('#toastContainer');
            const modalOverlay = $('#modalOverlay');
            const modalContent = $('#modalContent');
            const mobileMenu = $('#mobileMenu');
            const mobileToggle = $('#mobileToggle');
            const siteHeader = $('#siteHeader');

            let cartCount = 0;
            let currentFilter = 'all';
            let currentSort = 'default';
            let searchQuery = '';
            let wishlist = new Set();

            // ──────────────── TOAST ────────────────
            function showToast(message, type = '') {
                const toast = document.createElement('div');
                toast.className = `toast ${type}`;
                const icon = type === 'success' ? 'fa-circle-check' : 'fa-circle-info';
                toast.innerHTML = `<i class="fas ${icon}"></i> ${escapeHtml(message)}`;
                toastContainer.appendChild(toast);
                setTimeout(() => toast.remove(), 2600);
            }

            // ──────────────── UTILS ────────────────
            function escapeHtml(text) {
                const map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' };
                return String(text).replace(/[&<>"']/g, s => map[s]);
            }

            function getFilteredProducts() {
                let list = [...PRODUCTS];
                if (currentFilter !== 'all') list = list.filter(p => p.category === currentFilter);
                if (searchQuery) {
                    const q = searchQuery.toLowerCase();
                    list = list.filter(p => p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q));
                }
                if (currentSort === 'price-asc') list.sort((a, b) => a.price - b.price);
                else if (currentSort === 'price-desc') list.sort((a, b) => b.price - a.price);
                else if (currentSort === 'rating') list.sort((a, b) => b.rating - a.rating);
                return list;
            }

            function bumpCartBadge() {
                cartCountEl.classList.remove('bump');
                void cartCountEl.offsetWidth;
                cartCountEl.classList.add('bump');
            }

            // ──────────────── RENDER CATEGORIES ────────────────
            function renderCategories() {
                categoriesGrid.innerHTML = CATEGORIES.map(cat => `
                    <div class="cat-card" data-category="${cat.id}" role="button" tabindex="0" aria-label="Browse ${cat.name}">
                        <div class="cat-icon"><i class="fas ${cat.icon}"></i></div>
                        <h4>${cat.name}</h4>
                        <div class="cat-count">${cat.count} products</div>
                    </div>
                `).join('');

                categoriesGrid.querySelectorAll('.cat-card').forEach(card => {
                    card.addEventListener('click', () => {
                        const cat = card.dataset.category;
                        currentFilter = cat;
                        searchInput.value = cat;
                        searchQuery = cat;
                        updateFilterTabs(cat);
                        renderProducts();
                        document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
                    });
                });
            }

            // ──────────────── RENDER PRODUCTS ────────────────
            function getBadgeHTML(badge) {
                if (!badge) return '';
                const map = {
                    'new': '<span class="product-badge badge-new">New</span>',
                    'sale': '<span class="product-badge badge-sale">Sale</span>',
                    'trend': '<span class="product-badge badge-trend">Trending</span>'
                };
                return map[badge] || '';
            }

            function getStarsHTML(rating) {
                const full = Math.floor(rating);
                const half = rating % 1 >= 0.5 ? 1 : 0;
                let html = '';
                for (let i = 0; i < full; i++) html += '<i class="fas fa-star"></i>';
                if (half) html += '<i class="fas fa-star-half-alt"></i>';
                const empty = 5 - full - half;
                for (let i = 0; i < empty; i++) html += '<i class="far fa-star"></i>';
                return html;
            }

            function renderProducts() {
                const list = getFilteredProducts();
                resultCount.textContent = `${list.length} product${list.length !== 1 ? 's' : ''}`;

                if (list.length === 0) {
                    productsGrid.innerHTML = '';
                    emptyState.style.display = 'block';
                } else {
                    emptyState.style.display = 'none';
                    productsGrid.innerHTML = list.map(p => `
                        <article class="product-card" data-id="${p.id}">
                            <div class="product-img-wrap">
                                ${getBadgeHTML(p.badge)}
                                <div class="product-actions-overlay">
                                    <button class="quick-view-btn" data-id="${p.id}" aria-label="Quick view" title="Quick View">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="wish-btn ${wishlist.has(p.id) ? 'wishlisted' : ''}" data-id="${p.id}" aria-label="${wishlist.has(p.id) ? 'Remove from wishlist' : 'Add to wishlist'}" title="Wishlist">
                                        <i class="${wishlist.has(p.id) ? 'fas' : 'far'} fa-heart"></i>
                                    </button>
                                </div>
                                <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy" />
                            </div>
                            <div class="product-body">
                                <div class="product-category">${p.category}</div>
                                <h5>${escapeHtml(p.title)}</h5>
                                <div class="product-rating">
                                    <span class="stars">${getStarsHTML(p.rating)}</span>
                                    <span class="count">(${p.reviews})</span>
                                </div>
                                <div class="product-price-row">
                                    <span class="product-price">$${p.price.toLocaleString()}</span>
                                    ${p.oldPrice ? `<span class="product-old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
                                </div>
                            </div>
                            <div class="product-footer">
                                <button class="add-to-cart-btn" data-id="${p.id}">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            </div>
                        </article>
                    `).join('');

                    // Attach listeners
                    productsGrid.querySelectorAll('.add-to-cart-btn').forEach(btn => {
                        btn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            const id = Number(btn.dataset.id);
                            addToCart(id, btn);
                        });
                    });

                    productsGrid.querySelectorAll('.wish-btn').forEach(btn => {
                        btn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            const id = Number(btn.dataset.id);
                            toggleWishlist(id, btn);
                        });
                    });

                    productsGrid.querySelectorAll('.quick-view-btn').forEach(btn => {
                        btn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            const id = Number(btn.dataset.id);
                            openQuickView(id);
                        });
                    });
                }
            }

            // ──────────────── CART ────────────────
            function addToCart(productId, btn) {
                const p = PRODUCTS.find(x => x.id === productId);
                if (!p) return;
                cartCount++;
                cartCountEl.textContent = cartCount;
                bumpCartBadge();

                if (btn) {
                    const originalHTML = btn.innerHTML;
                    btn.innerHTML = '<i class="fas fa-check"></i> Added!';
                    btn.classList.add('added');
                    btn.disabled = true;
                    setTimeout(() => {
                        btn.innerHTML = originalHTML;
                        btn.classList.remove('added');
                        btn.disabled = false;
                    }, 1500);
                }
                showToast(`${p.title} added to cart`, 'success');
            }

            function toggleWishlist(productId, btn) {
                if (wishlist.has(productId)) {
                    wishlist.delete(productId);
                    if (btn) {
                        btn.classList.remove('wishlisted');
                        btn.querySelector('i').className = 'far fa-heart';
                        btn.setAttribute('aria-label', 'Add to wishlist');
                    }
                    showToast('Removed from wishlist');
                } else {
                    wishlist.add(productId);
                    if (btn) {
                        btn.classList.add('wishlisted');
                        btn.querySelector('i').className = 'fas fa-heart';
                        btn.setAttribute('aria-label', 'Remove from wishlist');
                    }
                    showToast('Added to wishlist', 'success');
                }
            }

            // ──────────────── QUICK VIEW ────────────────
            function openQuickView(productId) {
                const p = PRODUCTS.find(x => x.id === productId);
                if (!p) return;
                modalContent.innerHTML = `
                    <button class="modal-close" id="modalClose" aria-label="Close modal"><i class="fas fa-times"></i></button>
                    <img src="${p.img}" alt="${escapeHtml(p.title)}" />
                    <h3 id="modalTitle">${escapeHtml(p.title)}</h3>
                    <div class="product-rating" style="margin-bottom:8px">
                        <span class="stars">${getStarsHTML(p.rating)}</span>
                        <span class="count">(${p.reviews} reviews)</span>
                    </div>
                    <div class="modal-price">$${p.price.toLocaleString()} ${p.oldPrice ? `<span style="font-size:16px;color:var(--muted-light);text-decoration:line-through;font-weight:400">$${p.oldPrice.toLocaleString()}</span>` : ''}</div>
                    <p class="modal-desc">Premium quality ${p.category} item. Fast shipping, easy returns, and a 30-day satisfaction guarantee.</p>
                    <button class="btn btn-primary btn-block add-to-cart-btn" data-id="${p.id}" id="modalAddBtn">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                `;
                modalOverlay.classList.add('open');
                document.body.style.overflow = 'hidden';

                $('#modalClose').addEventListener('click', closeModal);
                $('#modalAddBtn').addEventListener('click', () => {
                    addToCart(p.id, $('#modalAddBtn'));
                    setTimeout(closeModal, 600);
                });
            }

            function closeModal() {
                modalOverlay.classList.remove('open');
                document.body.style.overflow = '';
            }
            modalOverlay.addEventListener('click', (e) => {
                if (e.target === modalOverlay) closeModal();
            });
            document.addEventListener('keydown', (e) => {
                if (e.key === 'Escape' && modalOverlay.classList.contains('open')) closeModal();
            });

            // ──────────────── FILTER & SORT ────────────────
            function updateFilterTabs(activeFilter) {
                $$('.toolbar-tab').forEach(tab => {
                    tab.classList.toggle('active', tab.dataset.filter === activeFilter);
                    tab.setAttribute('aria-selected', tab.dataset.filter === activeFilter ? 'true' : 'false');
                });
            }

            $('#filterTabs').addEventListener('click', (e) => {
                const tab = e.target.closest('.toolbar-tab');
                if (!tab) return;
                currentFilter = tab.dataset.filter;
                updateFilterTabs(currentFilter);
                if (currentFilter !== 'all') {
                    searchInput.value = currentFilter;
                    searchQuery = currentFilter;
                } else {
                    searchInput.value = '';
                    searchQuery = '';
                }
                searchClear.style.display = searchQuery ? 'inline-flex' : 'none';
                renderProducts();
            });

            sortSelect.addEventListener('change', () => {
                currentSort = sortSelect.value;
                renderProducts();
            });

            // ──────────────── SEARCH ────────────────
            $('#searchBtn').addEventListener('click', () => {
                searchQuery = searchInput.value.trim();
                currentFilter = 'all';
                updateFilterTabs('all');
                searchClear.style.display = searchQuery ? 'inline-flex' : 'none';
                renderProducts();
            });

            searchInput.addEventListener('keydown', (e) => {
                if (e.key === 'Enter') {
                    searchQuery = searchInput.value.trim();
                    currentFilter = 'all';
                    updateFilterTabs('all');
                    searchClear.style.display = searchQuery ? 'inline-flex' : 'none';
                    renderProducts();
                }
            });

            searchInput.addEventListener('input', () => {
                searchClear.style.display = searchInput.value ? 'inline-flex' : 'none';
            });

            searchClear.addEventListener('click', () => {
                searchInput.value = '';
                searchQuery = '';
                currentFilter = 'all';
                updateFilterTabs('all');
                searchClear.style.display = 'none';
                renderProducts();
                searchInput.focus();
            });

            $('#clearSearch').addEventListener('click', () => {
                searchInput.value = '';
                searchQuery = '';
                currentFilter = 'all';
                updateFilterTabs('all');
                searchClear.style.display = 'none';
                renderProducts();
            });

            // ──────────────── MOBILE MENU ────────────────
            mobileToggle.addEventListener('click', () => {
                const isOpen = mobileMenu.classList.toggle('open');
                mobileToggle.setAttribute('aria-expanded', isOpen);
                mobileToggle.innerHTML = isOpen ? '<i class="fas fa-times"></i>' : '<i class="fas fa-bars"></i>';
            });

            // Close mobile menu on link click
            mobileMenu.querySelectorAll('a').forEach(link => {
                link.addEventListener('click', () => {
                    mobileMenu.classList.remove('open');
                    mobileToggle.setAttribute('aria-expanded', 'false');
                    mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
                });
            });

            // ──────────────── HEADER SCROLL EFFECT ────────────────
            let scrollTicking = false;
            window.addEventListener('scroll', () => {
                if (!scrollTicking) {
                    requestAnimationFrame(() => {
                        siteHeader.classList.toggle('scrolled', window.scrollY > 10);
                        scrollTicking = false;
                    });
                    scrollTicking = true;
                }
            });

            // ──────────────── COUNTDOWN ────────────────
            (function setupDealTimer() {
                const now = new Date();
                const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);

                function tick() {
                    const diff = target - new Date();
                    if (diff <= 0) {
                        ['dealDays', 'dealHours', 'dealMinutes', 'dealSeconds'].forEach(id => $(`#${id}`).textContent = '00');
                        return;
                    }
                    const days = Math.floor(diff / (24 * 3600 * 1000));
                    const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
                    const mins = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
                    const secs = Math.floor((diff % (60 * 1000)) / 1000);
                    $('#dealDays').textContent = days;
                    $('#dealHours').textContent = String(hours).padStart(2, '0');
                    $('#dealMinutes').textContent = String(mins).padStart(2, '0');
                    $('#dealSeconds').textContent = String(secs).padStart(2, '0');
                }
                tick();
                setInterval(tick, 1000);
            })();

            // ──────────────── NEWSLETTER ────────────────
            $('#newsletterForm').addEventListener('submit', (e) => {
                e.preventDefault();
                const email = $('#newsletterEmail').value.trim();
                const msg = $('#newsletterMsg');
                if (!email || !email.includes('@') || !email.includes('.')) {
                    msg.textContent = 'Please enter a valid email address.';
                    msg.style.color = '#fca5a5';
                    return;
                }
                msg.textContent = '🎉 You\'re subscribed! Check your inbox.';
                msg.style.color = '#a5f3d0';
                $('#newsletterEmail').value = '';
                setTimeout(() => { msg.textContent = ''; }, 4000);
            });

            // ──────────────── BUTTON BINDINGS ────────────────
            $('#shopNow').addEventListener('click', () => {
                document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
            });
            $('#exploreDeals').addEventListener('click', () => {
                document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
            });
            $('#buyDeal').addEventListener('click', () => {
                cartCount++;
                cartCountEl.textContent = cartCount;
                bumpCartBadge();
                showToast('MacBook Air M2 added to cart!', 'success');
            });

            // ──────────────── INIT ────────────────
            function init() {
                renderCategories();
                renderProducts();
                $('#year').textContent = new Date().getFullYear();
                searchClear.style.display = 'none';
            }
            init();
        })();
    </script>
</body>
</html>
