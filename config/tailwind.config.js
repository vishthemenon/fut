const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    safelist: [
      {
      pattern: /(bg|text)-(red|green|lime|yellow|amber|orange|emerald)-(100|200|300|800)/,
    },
    ],
    content: [
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*'
    ],
    theme: {
        extend: {
            colors: {
                'lime': {
                    200: '#365314'
                }
            },
            fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
    ]
}
