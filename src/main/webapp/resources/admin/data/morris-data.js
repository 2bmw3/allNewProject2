$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010',
            상의: 2666,
            하의: null,
            아우터: 2647,
            신발및악세사리 : 2225,
            기타 : 160
        }, {
            period: '2011',
            상의: 2778,
            하의: 2294,
            아우터: 2441,
            신발및악세사리 : 3521,
            기타 : 788
        }, {
            period: '2012',
            상의: 4912,
            하의: 1969,
            아우터: 2501,
            신발및악세사리 : 6650,
            기타 : 63
        }, {
            period: '2013',
            상의: 3767,
            하의: 3597,
            아우터: 5689,
            신발및악세사리 : 2235,
            기타 : 770
        }, {
            period: '2014',
            상의: 6810,
            하의: 1914,
            아우터: 2293,
            신발및악세사리 : 1168,
            기타 : 1770
        }, {
            period: '2015',
            상의: 5670,
            하의: 10293,
            아우터: 1881,
            신발및악세사리 : 665,
            기타 : 698
        }, {
            period: '2016',
            상의: 12360,
            하의: 8795,
            아우터: 1588,
            신발및악세사리 : 352,
            기타 : 990
        }, {
            period: '2017',
            상의: 506,
            하의: 230,
            아우터: 450,
            신발및악세사리 : 120,
            기타 : 23
        }],
        xkey: 'period',
        ykeys: ['상의', '하의', '아우터', '신발및악세사리', '기타'],
        labels: ['상의', '하의', '아우터', '신발및악세사리', '기타'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "상의",
            value: 3.2
        }, {
            label: "하의",
            value: 3.5
        }, {
            label: "아우터",
            value: 4.6
        }, {
            label: "신발 및 악세사리",
            value: 3.9
        }, {
            label: "기타",
            value: 4.4
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '10대',
            a: 33,
            b: 67
        }, {
            y: '20대',
            a: 43,
            b: 57
        }, {
            y: '30대',
            a: 12,
            b: 78
        }, {
            y: '40대',
            a: 0,
            b: 100
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['남자', '여자'],
        hideHover: 'auto',
        resize: true
    });
    
});
