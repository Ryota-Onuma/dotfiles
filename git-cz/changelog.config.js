module.exports = {
  disableEmoji: false,
  format: '{type}: {emoji}{subject}',
  list: [
    "fix",
    "feat",
    "refactor",
    "test",
    "style",
    "chore",
    "docs",
    "perf",
    "ci",
    "gen"
  ],
  maxMessageLength: 64,
  minMessageLength: 3,
  questions: ["type","subject"],
  scopes: [],
  types: {
    chore: {
      description: "ドキュメントの生成やビルドプロセス、ライブラリなどの変更",
      value: "chore",
      emoji: "🤖"
    },
    ci: {
      description: "CI用の設定やスクリプトに関する変更",
      value: "ci",
      emoji: "🎡"
    },
    docs: {
      description: "ドキュメントのみの変更",
      value: "docs",
      emoji: "📝"
    },
    feat: {
      description: "新機能",
      value: "feat",
      emoji: "✨"
    },
    fix: {
      description: "不具合の修正",
      value: "fix",
      emoji: "🐛"
    },
    perf: {
      description: "パフォーマンス改善を行うためのコードの変更",
      value: "performance",
      emoji: "⚡️"
    },
    refactor: {
      description: "バグ修正や機能の追加を行わないコードの変更",
      value: "refactor",
      emoji: "♻️'"
    },
    style: {
      description: "コードの処理に影響しない変更（スペースや書式設定など）",
      value: "style",
      emoji: "💄"
    },
    test: {
      description: "テストコードの変更",
      value: "test",
      emoji: "💍"
    },
    gen: {
      description: "自動生成",
      value: "generate",
      emoji: "🔨"
    }
  },
};
