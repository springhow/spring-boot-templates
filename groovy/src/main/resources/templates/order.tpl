yieldUnescaped '<!doctype html>'
html(lang: 'en') {
    head {
        meta(charset: 'UTF-8')
        meta(name: 'viewport',
                content: 'width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0')
        meta('http-equiv': 'X-UA-Compatible', content: 'ie=edge')
        title('Spring Boot - Groovy')
        link(rel: 'stylesheet', href: '//cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.2/tailwind.css')
    }
    body {
        div(class: 'flex items-center justify-center h-screen') {
            div(class: 'rounded-lg border shadow-lg p-10 w-3/5') {
                div(class: 'flex flex-row justify-between pb-4') {
                    div {
                        h2(class: 'text-xl font-bold') {
                            yield 'Order #'
                            span(class: 'text-green-600', "${orderEntry.orderId}")
                        }
                    }
                    div {
                        div(class: "text-xl font-bold", "${orderEntry.date}")
                    }
                }
                div(class: "flex flex-col pb-8") {
                    div(class: "pb-2") {
                        h2(class: "text-xl font-bold", "Delivery Address")
                    }
                    div orderEntry.account.address.street
                    div orderEntry.account.address.city
                    div orderEntry.account.address.state
                    div orderEntry.account.address.zipCode
                }
                table(class: "table-fixed w-full text-right border rounded") {
                    thead(class: "bg-gray-100") {
                        tr {
                            th(class: "text-left pl-4", "Product")
                            th("Qty")
                            th("Price")
                            th(class: "pr-4", "Total")
                        }
                    }
                    tbody {
                        orderEntry.items.each { item ->
                            tr {
                                td(class: 'pl-4 text-left', "${item.name}")
                                td("${item.quantity}")
                                td("${item.price}")
                                td(class: "pr-4", "${item.price * item.quantity}")
                            }
                        }
                    }
                }
                div(class: "flex flex-row-reverse p-5") {
                    h2(class: "font-medium bg-gray-200 p-2 rounded") {
                        yield "Grand Total: "
                        span(class: "text-green-600", "$orderEntry.payment.amount")
                    }
                }
                h2(class: "text-xl font-bold", "Payment Details")
                table(class: "table-fixed text-left w-2/6 border") {
                    tr {
                        th(class: "text-green-600", "Card Number")
                        td orderEntry.payment.cardNumber
                    }
                    tr {
                        th(class: "text-green-600", "CVV")
                        td orderEntry.payment.cvv
                    }
                    tr {
                        th(class: "text-green-600", "Expires (MM/YYYY)")
                        td "$orderEntry.payment.month/$orderEntry.payment.year"
                    }
                }
            }
        }
    }
}
