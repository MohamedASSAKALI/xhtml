$(document).ready(function () {
    function fetchPaidInvoicesCount() {
        $.ajax({
            url: '../model/queries.php',
            type: 'POST',
            data: {action: "get_paid_invoices_count"},
            success: function (response) {
                let data = JSON.parse(response);
                if (data.success === 'true') {
                    alert("Total Paid Invoices: " + data.total_paid_invoices);
                    document.getElementById('paidInvoices').textContent = data.total_paid_invoices;
                } else {
                    document.getElementById('paidInvoices').textContent = 'Error';
                    console.error('Error fetching data:', data.error);
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching data:', error);
                document.getElementById('paidInvoices').textContent = 'Error';
            }
        });
    }
    
    // Call the function to fetch the count when the page loads
    fetchPaidInvoicesCount();
    alert("rak hna");
});
