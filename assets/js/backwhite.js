$(() => {
    // Menu button handling
    $('.bw-open').click(() => {
        $('.bw-back-container').addClass('visible')
        $('.bw-front').animate(
            {'margin-left': '100%'},
            400, 'swing')
    })
    $('.bw-close').click(() => {
        $('.bw-front').animate(
            {'margin-left': '0%'},
            400, 'swing',
            () => $('.bw-back-container').removeClass('visible'))
    })

    // Dynamic Tables
    $('.bw-front table').each((_, table) => {
        // Find longest
        let longest = $(table)
            .find('th,td')
            .map((_, elem) => $(elem).text())
            .get()
            .reduce((a, b) => a.length >= b.length ? a : b, '')

        // Get length of longest
        let font = $(table).find('td').css('font')
        let canvas = document.createElement('canvas')
        let ctx = canvas.getContext('2d')
        ctx.font = font
        let length = ctx.measureText(longest).width

        // Set table cell lengths to length of longest
        $(table).find('th,td').css('width', length)
    })
})