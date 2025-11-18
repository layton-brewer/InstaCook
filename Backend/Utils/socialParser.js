// socialParser.js
// Utility to parse Instagram, TikTok, and YouTube URLs and return a normalized payload.
// Real implementation would call each platform's APIs or scraping utilities.

function detectSource(url) {
  if (/tiktok\.com/.test(url)) return 'tiktok';
  if (/instagram\.com/.test(url)) return 'instagram';
  if (/youtube\.com|youtu\.be/.test(url)) return 'youtube';
  return 'unknown';
}

async function parseSocialUrl(url) {
  const source = detectSource(url);

  // Placeholder implementation: in a real system, fetch captions/frames/metadata.
  return {
    postId: 'demo-' + Date.now().toString(36),
    source,
    caption: 'Demo caption extracted from social content.',
    media: 'https://cdn.instacook.io/media/demo-frame.jpg',
  };
}

module.exports = { parseSocialUrl };
