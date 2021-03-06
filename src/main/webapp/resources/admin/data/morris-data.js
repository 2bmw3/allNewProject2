$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010',
            상의: 0,
            하의: null,
            아우터: 0,
            신발및악세사리 : 0,
            기타 : 0
        }, {
            period: '2011',
            상의: 0,
            하의: 0,
            아우터: 0,
            신발및악세사리 : 0,
            기타 : 0
        }, {
            period: '2012',
            상의: 0,
            하의: 0,
            아우터: 0,
            신발및악세사리 : 0,
            기타 : 0
        }, {
            period: '2013',
            상의: 0,
            하의: 0,
            아우터: 0,
            신발및악세사리 : 0,
            기타 : 0
        }, {
            period: '2014',
            상의: 0,
            하의: 0,
            아우터: 0,
            신발및악세사리 : 0,
            기타 :0
        }, {
            period: '2015',
            상의: 0.5,
            하의: 0.5,
            아우터: 1,
            신발및악세사리 : 0.25,
            기타 : 0.25
        }, {
            period: '2016',
            상의: 0.75,
            하의: 0.75,
            아우터: 2,
            신발및악세사리 : 0.5,
            기타 : 0.1
        }, {
            period: '2017',
            상의: 0.25,
            하의: 0.25,
            아우터: 0.5,
            신발및악세사리 : 0.3,
            기타 : 0.6
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
            value: 14
        }, {
            label: "하의",
            value: 16
        }, {
            label: "아우터",
            value: 35
        }, {
            label: "신발 및 악세사리",
            value: 21
        }, {
            label: "기타",
            value: 14
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
