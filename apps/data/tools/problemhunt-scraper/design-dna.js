#!/usr/bin/env node
/**
 * ProblemHunt Design DNA — Lúa
 *
 * Genera DESIGN.md con alma real para cada proyecto.
 * No dos proyectos iguales.
 *
 * Inspirado en Google Labs design.md + open-design design systems reales.
 */

const fs = require('fs');
const path = require('path');

// ─────────────────────────────────────────────────────────────────────────────
// DESIGN SYSTEMS — Palettes y tipografías reales de marcas conocidas
// ─────────────────────────────────────────────────────────────────────────────

const DESIGN_SYSTEMS = {

  // ── STRIPE ─────────────────────────────────────────────────────────────────
  stripe: {
    name: 'Stripe',
    mood: 'Fintech premium. Pagos, bancos, dinero. Confianza + precisión.',
    palette: {
      primary:   '#0A2540',  // Deep navy
      secondary: '#635BFF',  // Stripe purple
      tertiary:  '#00D4FF',  // Cyan accent
      neutral:   '#F6F9FC',  // Light blue-grey
      dark:      '#1A1F36',  // Dark panel
      accent:    '#22C55E',  // Success green
      text:      '#1A1F36',
      muted:     '#8898AA',
    },
    typography: {
      heading: { family: 'SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif', size: '2rem', weight: '600', lineHeight: '1.2' },
      body:    { family: 'SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      mono:    { family: 'SF Mono, JetBrains Mono, monospace', size: '0.875rem', weight: '400' }
    },
    rounded: { sm: '4px', md: '8px', lg: '12px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── LINEAR ─────────────────────────────────────────────────────────────────
  linear: {
    name: 'Linear',
    mood: 'Developer tool, project management, productivity. Dark + precise.',
    palette: {
      primary:   '#FFFFFF',
      secondary: '#8A8F98',
      tertiary:  '#655DE6',  // Linear purple
      neutral:   '#0D0D0F',  // Near black
      dark:      '#191919',  // Dark panel
      accent:    '#10B981',  // Emerald
      text:      '#FFFFFF',
      muted:     '#8A8F98',
      border:    '#2E2E3A'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '0.9rem', weight: '400', lineHeight: '1.5' },
      mono:    { family: 'JetBrains Mono, SF Mono, monospace', size: '0.8125rem', weight: '400' }
    },
    rounded: { sm: '4px', md: '6px', lg: '8px' },
    spacing: { sm: '4px', md: '12px', lg: '24px', xl: '48px' }
  },

  // ── NOTION ─────────────────────────────────────────────────────────────────
  notion: {
    name: 'Notion',
    mood: 'Personal workspace, notes, wiki, knowledge. Warm + calm.',
    palette: {
      primary:   '#1A1A1A',
      secondary: '#9B9A97',
      tertiary:  '#EB5757',  // Notion red
      neutral:   '#FFFFFF',
      dark:      '#F7F6F3',  // Warm off-white
      accent:    '#2383E2',  // Notion blue
      text:      '#37352F',
      muted:     '#9B9A97',
      bg:        '#F7F6F3'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.5rem', weight: '600', lineHeight: '1.4' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.5' }
    },
    rounded: { sm: '4px', md: '6px', lg: '0px' },
    spacing: { sm: '4px', md: '12px', lg: '24px', xl: '48px' }
  },

  // ── AIRBNB ─────────────────────────────────────────────────────────────────
  airbnb: {
    name: 'Airbnb',
    mood: 'Travel, hospitality, marketplace. Warm, human, trustworthy.',
    palette: {
      primary:   '#FF385C',  // Airbnb coral/pink
      secondary: '#717166',
      tertiary:  '#00A699',  // Teal
      neutral:   '#FFFFFF',
      dark:      '#F7F7F7',
      accent:    '#FF385C',
      text:      '#222222',
      muted:     '#717166',
      bg:        '#FFFFFF'
    },
    typography: {
      heading: { family: 'Circular, -apple-system, BlinkMacSystemFont, sans-serif', size: '1.75rem', weight: '700', lineHeight: '1.2' },
      body:    { family: 'Circular, -apple-system, BlinkMacSystemFont, sans-serif', size: '1rem', weight: '400', lineHeight: '1.5' },
      ui:      { family: 'Circular, -apple-system, BlinkMacSystemFont, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '8px', md: '12px', lg: '24px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── FIGMA ──────────────────────────────────────────────────────────────────
  figma: {
    name: 'Figma',
    mood: 'Creative tool, design, collaboration. Bold + expressive.',
    palette: {
      primary:   '#A259FF',  // Figma purple
      secondary: '#959595',
      tertiary:  '#00D4AA',  // Teal
      neutral:   '#1E1E1E',  // Dark bg
      dark:      '#2C2C2C',  // Panel
      accent:    '#FF6B00',  // Orange
      text:      '#FFFFFF',
      muted:     '#959595',
      bg:        '#1E1E1E'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '2rem', weight: '700', lineHeight: '1.2' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '0.9375rem', weight: '400', lineHeight: '1.5' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.8125rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '6px', md: '8px', lg: '12px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '48px' }
  },

  // ── CAL.COM ─────────────────────────────────────────────────────────────────
  calcom: {
    name: 'Cal.com',
    mood: 'Scheduling, booking, calendar. Clean + professional.',
    palette: {
      primary:   '#000000',
      secondary: '#666666',
      tertiary:  '#2563EB',  // Blue
      neutral:   '#FAFAFA',
      dark:      '#111111',
      accent:    '#EA580C',  // Orange
      text:      '#000000',
      muted:     '#666666',
      bg:        '#FFFFFF'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.5rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '0.9375rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '6px', md: '8px', lg: '12px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── FRAMER ─────────────────────────────────────────────────────────────────
  framer: {
    name: 'Framer',
    mood: 'Landing pages, creative web, prototyping. Bold + modern.',
    palette: {
      primary:   '#000000',
      secondary: '#636366',
      tertiary:  '#0066FF',  // Framer blue
      neutral:   '#FAFAFA',
      dark:      '#0A0A0A',
      accent:    '#0A0A0A',
      text:      '#000000',
      muted:     '#636366',
      bg:        '#FFFFFF'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '2.5rem', weight: '800', lineHeight: '1.1' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.9375rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '8px', md: '12px', lg: '24px' },
    spacing: { sm: '8px', md: '16px', lg: '40px', xl: '80px' }
  },

  // ── SUPERBASE ───────────────────────────────────────────────────────────────
  supabase: {
    name: 'Supabase',
    mood: 'Developer tools, database, open source. Technical + vibrant.',
    palette: {
      primary:   '#1A1A1A',
      secondary: '#666666',
      tertiary:  '#3ECF8E',  // Supabase green
      neutral:   '#FAFAFA',
      dark:      '#1A1A1A',
      accent:    '#3ECF8E',
      text:      '#1A1A1A',
      muted:     '#666666',
      bg:        '#FFFFFF'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      mono:    { family: 'JetBrains Mono, SF Mono, monospace', size: '0.875rem', weight: '400' }
    },
    rounded: { sm: '6px', md: '8px', lg: '16px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── LOOM ───────────────────────────────────────────────────────────────────
  loom: {
    name: 'Loom',
    mood: 'Video messaging, async comms, screen recording. Fun + fast.',
    palette: {
      primary:   '#625DF5',  // Loom purple
      secondary: '#7B799C',
      tertiary:  '#EE4D3A',  // Red
      neutral:   '#FFFFFF',
      dark:      '#1D1D1F',  // Dark
      accent:    '#625DF5',
      text:      '#1D1D1F',
      muted:     '#7B799C',
      bg:        '#F7F7F7'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.5' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '6px', md: '12px', lg: '20px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── CLERK ───────────────────────────────────────────────────────────────────
  clerk: {
    name: 'Clerk',
    mood: 'Auth, identity, security. Dark + trustworthy.',
    palette: {
      primary:   '#7435F1',  // Clerk purple
      secondary: '#5E60CE',
      tertiary:  '#00C9C7',  // Teal
      neutral:   '#151515',
      dark:      '#1F1F1F',
      accent:    '#7435F1',
      text:      '#FFFFFF',
      muted:     '#8A8A8A',
      bg:        '#0F0F0F'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '8px', md: '12px', lg: '16px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── VERCEL ─────────────────────────────────────────────────────────────────
  vercel: {
    name: 'Vercel',
    mood: 'Deployment, developer tools, cloud. Minimal + precise.',
    palette: {
      primary:   '#FFFFFF',
      secondary: '#666666',
      tertiary:  '#FF5B4F',  // Red
      neutral:   '#000000',
      dark:      '#171717',
      accent:    '#0072F5',  // Blue
      text:      '#171717',
      muted:     '#666666',
      bg:        '#000000'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '2rem', weight: '600', lineHeight: '1.2', tracking: '-0.02em' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      mono:    { family: 'Geist Mono, JetBrains Mono, monospace', size: '0.875rem', weight: '400' }
    },
    rounded: { sm: '4px', md: '6px', lg: '8px' },
    spacing: { sm: '4px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── NORTHONE ────────────────────────────────────────────────────────────────
  northone: {
    name: 'Northone',
    mood: 'Banking for small business, emerging markets. Warm + accessible.',
    palette: {
      primary:   '#1A1A1A',
      secondary: '#6B6B6B',
      tertiary:  '#7B61FF',  // Purple
      neutral:   '#FFFFFF',
      dark:      '#F5F5F0',  // Warm white
      accent:    '#00E5BE',  // Teal
      text:      '#1A1A1A',
      muted:     '#6B6B6B',
      bg:        '#F5F5F0'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '600', lineHeight: '1.3' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.9375rem', weight: '500', lineHeight: '1.5' }
    },
    rounded: { sm: '8px', md: '12px', lg: '20px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── HEADSPACE ──────────────────────────────────────────────────────────────
  headspace: {
    name: 'Headspace',
    mood: 'Mental health, therapy, wellness. Calm + approachable.',
    palette: {
      primary:   '#FFFFFF',
      secondary: '#B0B8C1',
      tertiary:  '#F7C59F',  // Warm peach
      neutral:   '#3C3C3C',
      dark:      '#1F1F1F',
      accent:    '#83C586',  // Mint green
      text:      '#3C3C3C',
      muted:     '#B0B8C1',
      bg:        '#F7F7F7'
    },
    typography: {
      heading: { family: 'Nunito, Inter, system-ui, sans-serif', size: '1.75rem', weight: '700', lineHeight: '1.3' },
      body:    { family: 'Nunito, Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.6' },
      ui:      { family: 'Nunito, Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.5' }
    },
    rounded: { sm: '12px', md: '20px', lg: '32px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  },

  // ── DOORDASH ───────────────────────────────────────────────────────────────
  doordash: {
    name: 'DoorDash',
    mood: 'Delivery, logistics, food. Dark mode + orange energy.',
    palette: {
      primary:   '#FF3008',  // DoorDash red
      secondary: '#909090',
      tertiary:  '#00F1D4',  // Teal
      neutral:   '#FFFFFF',
      dark:      '#1C1C1C',
      accent:    '#FF3008',
      text:      '#1C1C1C',
      muted:     '#909090',
      bg:        '#FFFFFF'
    },
    typography: {
      heading: { family: 'Inter, system-ui, sans-serif', size: '1.75rem', weight: '700', lineHeight: '1.2' },
      body:    { family: 'Inter, system-ui, sans-serif', size: '1rem', weight: '400', lineHeight: '1.5' },
      ui:      { family: 'Inter, system-ui, sans-serif', size: '0.875rem', weight: '500', lineHeight: '1.4' }
    },
    rounded: { sm: '6px', md: '10px', lg: '16px' },
    spacing: { sm: '8px', md: '16px', lg: '32px', xl: '64px' }
  }
};

// ─────────────────────────────────────────────────────────────────────────────
// DESIGN DNA ENGINE
// Analiza title + tags → devuelve el design system más apropiado
// ─────────────────────────────────────────────────────────────────────────────

const KEYWORD_MAP = {
  stripe: {
    keywords: ['payment', 'payments', 'banking', 'finance', 'financial', 'invoice', 'billing', 'credit', 'debit', 'transaction', 'money', 'dollar', 'euro', 'nigeria', 'nigerian', 'africa', 'pay', 'salary', 'payroll', 'bookkeeping', 'accounting', 'expense', 'budget'],
    country: ['nigeria', 'india', 'pakistan', 'kenya', 'ghana', 'egypt', 'colombia', 'mexico', 'brazil'],
    products: ['payment', 'banking', 'fintech', 'budget', 'invoice', 'billing', 'accounting', 'salary', 'payroll']
  },
  linear: {
    keywords: ['project', 'task', 'management', 'pm', 'productivity', 'team', 'collaboration', 'workflow', 'sprint', 'kanban', 'roadmap', 'milestone', 'deadline', 'planning', 'tracker', 'automation', 'crm', 'pipeline'],
    products: ['project management', 'task tracker', 'crm', 'productivity', 'workflow', 'team tool', 'admin', 'dashboard', 'ops']
  },
  notion: {
    keywords: ['notes', 'wiki', 'knowledge', 'docs', 'documentation', 'second brain', 'personal', 'organize', 'information', 'research', 'learn', 'study'],
    products: ['notes', 'wiki', 'knowledge base', 'personal', 'docs', 'research']
  },
  airbnb: {
    keywords: ['hotel', 'travel', 'booking', 'rental', 'property', 'real estate', 'apartment', 'house', 'accommodation', 'hospitality', 'tourism', 'vacation', 'stay', 'host'],
    country: ['us', 'usa', 'uk', 'europe'],
    products: ['travel', 'booking', 'marketplace', 'rental', 'hospitality']
  },
  figma: {
    keywords: ['design', 'designer', 'creative', 'ui', 'ux', 'interface', 'visual', 'brand', 'logo', 'graphics', 'illustration', 'photo', 'image', 'video', 'animation', 'motion', 'figma'],
    products: ['design tool', 'creative', 'visual', 'ui design', 'branding']
  },
  calcom: {
    keywords: ['calendar', 'schedule', 'booking', 'appointment', 'meeting', 'demo', 'call', 'scheduler', 'availability', 'booking'],
    products: ['scheduling', 'calendar', 'booking', 'appointment']
  },
  framer: {
    keywords: ['landing', 'website', 'web', 'landing page', 'marketing', 'portfolio', 'startup', 'launch'],
    country: ['us', 'usa', 'uk', 'europe'],
    products: ['landing page', 'marketing site', 'portfolio', 'startup']
  },
  supabase: {
    keywords: ['database', 'db', 'api', 'backend', 'developer', 'open source', 'code', 'programming', 'sql', 'postgres', 'backend'],
    products: ['developer tool', 'database', 'api', 'backend']
  },
  loom: {
    keywords: ['video', 'screen', 'record', 'async', 'message', 'communication', 'demo', 'tutorial', 'walkthrough', 'screencast'],
    products: ['video', 'async comms', 'screen recording', 'messaging']
  },
  clerk: {
    keywords: ['auth', 'login', 'signup', 'sso', 'identity', 'security', 'password', 'verification', 'kyc', 'aml', 'fraud'],
    products: ['auth', 'identity', 'security', 'verification']
  },
  vercel: {
    keywords: ['deploy', 'deployment', 'hosting', 'cloud', 'server', 'infrastructure', 'devops', 'cicd', 'build'],
    products: ['developer tools', 'hosting', 'deployment', 'infrastructure']
  },
  northone: {
    keywords: ['banking', 'bank', 'fintech', 'business', 'sme', 'small business', 'emerging'],
    country: ['nigeria', 'india', 'pakistan', 'kenya', 'ghana', 'colombia', 'latin', 'africa', 'asia'],
    products: ['fintech', 'banking', 'business finance']
  },
  headspace: {
    keywords: ['mental', 'health', 'therapy', 'wellness', 'anxiety', 'depression', 'stress', 'mindfulness', 'meditation', 'gambling', 'addiction', 'support', 'habit', 'quit', 'rehab'],
    products: ['health', 'wellness', 'mental health', 'therapy', 'support']
  },
  doordash: {
    keywords: ['delivery', 'logistics', 'food', 'restaurant', 'courier', 'driver', 'delivery', 'order', 'shipping', 'transport', 'supply chain', 'warehouse'],
    country: ['us', 'usa', 'uk', 'europe'],
    products: ['delivery', 'logistics', 'marketplace', 'food']
  }
};

// Keywords que apuntan a mercado emerging (no US-first)
const EMERGING_PATTERNS = [
  'nigeria', 'nigerian', 'africa', 'india', 'pakistan', 'kenya', 'ghana',
  'latin', 'colombia', 'mexico', 'brazil', 'indonesia', 'vietnam',
  'third world', 'developing', 'emerging market'
];

function detectMarketEmoji(title, tags) {
  const text = `${title} ${tags}`.toLowerCase();
  for (const pattern of EMERGING_PATTERNS) {
    if (text.includes(pattern)) return '🌍 ';
  }
  return '';
}

function chooseDesignSystem(title, tags, category, description) {
  const text = `${title} ${tags} ${category} ${description}`.toLowerCase();

  let bestMatch = null;
  let bestScore = 0;

  for (const [systemKey, config] of Object.entries(KEYWORD_MAP)) {
    let score = 0;

    // Keyword matches
    for (const kw of config.keywords) {
      if (text.includes(kw)) score += 2;
    }

    // Product type matches
    if (config.products) {
      for (const prod of config.products) {
        if (text.includes(prod)) score += 3;
      }
    }

    // Country matches (boost for emerging market systems)
    if (config.country) {
      for (const c of config.country) {
        if (text.includes(c)) {
          score += 2;
          // If project mentions emerging market + system is for emerging markets, big boost
          if (systemKey === 'northone' || systemKey === 'stripe') {
            score += 4;
          }
        }
      }
    }

    // Health/mental health → Headspace
    if (text.match(/gambling|addiction|mental|therapy|health|depression|anxiety|stress|wellness|quit/)) {
      if (systemKey === 'headspace') score += 5;
    }

    // Design/creative → Figma
    if (text.match(/design|designer|creative|uiux|visual|figma|illustration/)) {
      if (systemKey === 'figma') score += 4;
    }

    // Video/screen → Loom
    if (text.match(/video|screen record|async|demo|walkthrough/)) {
      if (systemKey === 'loom') score += 4;
    }

    // Auth/security → Clerk
    if (text.match(/auth|login|signup|kyc|identity|verification|fraud/)) {
      if (systemKey === 'clerk') score += 4;
    }

    // Database/dev tool → Supabase
    if (text.match(/database|backend|api|developer|postgres|sql/)) {
      if (systemKey === 'supabase') score += 4;
    }

    // Scheduling → Cal.com
    if (text.match(/calendar|schedule|booking|appointment/)) {
      if (systemKey === 'calcom') score += 4;
    }

    if (score > bestScore) {
      bestScore = score;
      bestMatch = systemKey;
    }
  }

  // Default fallback
  if (!bestMatch || bestScore === 0) {
    // Use category-based fallback
    const catFallbacks = {
      finance: 'stripe',
      business: 'framer',
      tech: 'linear',
      dev: 'linear',
      ai: 'notion',
      marketing: 'framer',
      social: 'airbnb',
      education: 'calcom',
      health: 'headspace',
      media: 'loom',
      career: 'notion',
      freelance: 'northone',
      legal: 'stripe',
      retail: 'airbnb',
      logistics: 'doordash',
      productivity: 'linear',
      startups: 'framer'
    };
    bestMatch = catFallbacks[category] || 'notion';
  }

  return DESIGN_SYSTEMS[bestMatch] || DESIGN_SYSTEMS['notion'];
}

// ─────────────────────────────────────────────────────────────────────────────
// COMPONENT LIBRARY — Genera componentes para el DESIGN.md
// ─────────────────────────────────────────────────────────────────────────────

function generateComponents(ds, title) {
  const text = title.toLowerCase();

  // Base components
  const base = {
    'button-primary': {
      backgroundColor: `{colors.primary}`,
      textColor: `{colors.text}`,
      rounded: `{rounded.md}`,
      padding: '12px 24px'
    },
    'button-secondary': {
      backgroundColor: 'transparent',
      textColor: `{colors.primary}`,
      rounded: `{rounded.md}`,
      border: '1.5px solid {colors.primary}'
    },
    'card': {
      backgroundColor: `{colors.neutral}`,
      rounded: `{rounded.lg}`,
      shadow: '0 1px 3px rgba(0,0,0,0.08)'
    },
    'input': {
      backgroundColor: `{colors.neutral}`,
      border: '1.5px solid {colors.border}',
      rounded: `{rounded.sm}`,
      padding: '10px 14px'
    }
  };

  // Context-aware components
  const context = {};

  // Dark-mode apps
  if (ds.name === 'Linear' || ds.name === 'Clerk' || ds.name === 'Figma' || ds.name === 'Loom') {
    context['button-primary'] = { ...base['button-primary'], backgroundColor: ds.palette.tertiary };
    context['card'] = { ...base['card'], backgroundColor: '{colors.dark}', border: '1px solid {colors.border}' };
    context['input'] = { ...base['input'], backgroundColor: '{colors.dark}', border: '1px solid {colors.border}' };
  }

  // Fintech/payment apps
  if (ds.name === 'Stripe' || ds.name === 'Northone') {
    context['button-primary'] = { ...base['button-primary'], backgroundColor: ds.palette.secondary };
    context['card'] = { ...base['card'], border: '1px solid rgba(0,0,0,0.06)' };
    context['badge'] = { backgroundColor: '{colors.accent}', color: '#fff', rounded: '{rounded.sm}', padding: '4px 8px', fontSize: '12px' };
    context['input'] = { ...base['input'], border: '1px solid rgba(0,0,0,0.1)' };
  }

  // Healthcare/wellness
  if (ds.name === 'Headspace') {
    context['button-primary'] = { ...base['button-primary'], backgroundColor: ds.palette.accent, rounded: '{rounded.lg}', padding: '14px 28px' };
    context['card'] = { ...base['card'], backgroundColor: '{colors.neutral}', rounded: '{rounded.lg}' };
  }

  // Delivery/logistics
  if (ds.name === 'DoorDash') {
    context['button-primary'] = { ...base['button-primary'], backgroundColor: ds.palette.primary, borderRadius: '{rounded.md}' };
    context['card'] = { ...base['card'], backgroundColor: '{colors.dark}' };
  }

  // Merge base with context
  const result = { ...base, ...context };
  return result;
}

// ─────────────────────────────────────────────────────────────────────────────
// DESIGN MD GENERATOR
// ─────────────────────────────────────────────────────────────────────────────

function generateDesignMD(folderSlug, project) {
  const { title, description, tags, category, url, rawTitle } = project;
  const ds = chooseDesignSystem(rawTitle || title, tags, category, description);
  const components = generateComponents(ds, rawTitle || title);
  const date2 = new Date().toISOString().split('T')[0];
  const docTitle = rawTitle || title;

  // Build color map
  const colorMap = {
    primary:   ds.palette.primary,
    secondary: ds.palette.secondary,
    tertiary:  ds.palette.tertiary,
    neutral:   ds.palette.neutral,
    dark:      ds.palette.dark,
    accent:    ds.palette.accent,
    text:      ds.palette.text || ds.palette.primary,
    muted:     ds.palette.muted || ds.palette.secondary,
    bg:        ds.palette.bg || ds.palette.neutral,
    border:    ds.palette.border || 'rgba(0,0,0,0.1)'
  };

  // Build component string
  const compLines = Object.entries(components).map(([name, props]) => {
    const propStr = Object.entries(props).map(([k, v]) => `  ${k}: "${v}"`).join('\n');
    return ` ${name}:\n${propStr}`;
  }).join('\n');

  const yaml = `---
name: "${folderSlug}"
description: "${ds.mood}"
source: "${ds.name}"

colors:
 primary:   "${colorMap.primary}"
 secondary: "${colorMap.secondary}"
 tertiary:  "${colorMap.tertiary}"
 neutral:   "${colorMap.neutral}"
 dark:      "${colorMap.dark}"
 accent:    "${colorMap.accent}"
 text:      "${colorMap.text}"
 muted:     "${colorMap.muted}"
 bg:        "${colorMap.bg}"
 border:    "${colorMap.border}"

typography:
 heading:
   fontFamily: "${ds.typography.heading.family}"
   fontSize: "${ds.typography.heading.size}"
   fontWeight: "${ds.typography.heading.weight}"
   lineHeight: "${ds.typography.heading.lineHeight}"
${ds.typography.heading.tracking ? `   letterSpacing: "${ds.typography.heading.tracking}"` : ''}
 body:
   fontFamily: "${ds.typography.body.family}"
   fontSize: "${ds.typography.body.size}"
   fontWeight: "${ds.typography.body.weight}"
   lineHeight: "${ds.typography.body.lineHeight}"
${ds.typography.mono ? `
 mono:
   fontFamily: "${ds.typography.mono.family}"
   fontSize: "${ds.typography.mono.size}"
   fontWeight: "${ds.typography.mono.weight}"` : ''}

rounded:
 sm: "${ds.rounded.sm}"
 md: "${ds.rounded.md}"
 lg: "${ds.rounded.lg}"

spacing:
 sm: "${ds.spacing.sm}"
 md: "${ds.spacing.md}"
 lg: "${ds.spacing.lg}"
 xl: "${ds.spacing.xl}"

components:
${compLines}
---`;

  const markdown = `## ${ds.name} — Design System

**Inspirado en:** ${ds.name} (${ds.mood})

### Paleta de colores

| Token | Hex | Uso |
|-------|-----|-----|
| primary | ${colorMap.primary} | Elementos principales, acciones |
| secondary | ${colorMap.secondary} | Texto secundario, bordes |
| tertiary | ${colorMap.tertiary} | Acentos, highlights |
| neutral | ${colorMap.neutral} | Fondos neutros |
| dark | ${colorMap.dark} | Paneles oscuros |
| accent | ${colorMap.accent} | CTAs, notificaciones |
| text | ${colorMap.text} | Texto principal |
| muted | ${colorMap.muted} | Texto terciario |
| bg | ${colorMap.bg} | Fondo página |

### Tipografía

- **Headings:** ${ds.typography.heading.family} · ${ds.typography.heading.size} · ${ds.typography.heading.weight} weight
- **Body:** ${ds.typography.body.family} · ${ds.typography.body.size} · ${ds.typography.body.weight} weight
${ds.typography.mono ? `- **Mono:** ${ds.typography.mono.family} · ${ds.typography.mono.size}` : ''}

### Spacing (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| sm | ${ds.spacing.sm} | Elementos inline |
| md | ${ds.spacing.md} | Componentes |
| lg | ${ds.spacing.lg} | Secciones |
| xl | ${ds.spacing.xl} | Espaciado grande |

### Border radius

| Token | Valor | Uso |
|-------|-------|-----|
| sm | ${ds.rounded.sm} | Inputs, badges |
| md | ${ds.rounded.md} | Botones, cards |
| lg | ${ds.rounded.lg} | Paneles, modales |

### Componentes

- **Button primary:** bg ${colorMap.primary}, text ${colorMap.text}, rounded ${ds.rounded.md}
- **Button secondary:** outline, color ${colorMap.primary}, rounded ${ds.rounded.md}
- **Card:** bg ${colorMap.neutral}, rounded ${ds.rounded.lg}, shadow 0 1px 3px rgba(0,0,0,0.08)
- **Input:** bg ${colorMap.neutral}, border ${colorMap.border}, rounded ${ds.rounded.sm}

### Do's

- Usar la tipografía ${ds.typography.body.family.split(',')[0]} de forma consistente
- Aplicar spacing según la escala de ${ds.spacing.sm} / ${ds.spacing.md} / ${ds.spacing.lg}
- Priorizar ${colorMap.primary} para acciones principales
- Usar rounded ${ds.rounded.md} en todos los elementos interactivos

### Don'ts

- No usar más de 2 weights tipográficos en un mismo contexto
- No aplicar sombras mayores a 0.1 de opacity
- No mezclar palettes de diferentes sistemas

---

_Generado por ProblemHunt Design DNA · ${date2}_
`;

  return yaml + '\n\n' + markdown;
}

// ─────────────────────────────────────────────────────────────────────────────
// EXPORTAR
// ─────────────────────────────────────────────────────────────────────────────

module.exports = { generateDesignMD, chooseDesignSystem, DESIGN_SYSTEMS };