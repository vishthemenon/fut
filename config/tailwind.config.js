const defaultTheme = require('tailwindcss/defaultTheme')
const plugin = require('tailwindcss/plugin')

module.exports = {
    safelist: [{
        pattern: /(bg|text)-(red|green|lime|yellow|amber|orange|emerald)-(100|200|300|800)/,
    },],
    content: ['./app/helpers/**/*.rb', './app/javascript/**/*.js', './app/views/**/*', './app/components/**/*'],
    theme: {
        extend: {
            colors: {
                'lime': {
                    200: '#365314'
                }
            }, fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/line-clamp'),
    ]
}
