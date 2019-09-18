-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-09-18 12:29:29
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vicor`
--

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `sid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `total` int(10) NOT NULL COMMENT '购车商品总数',
  `price` decimal(10,2) NOT NULL COMMENT '价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`sid`, `uid`, `total`, `price`) VALUES
(9, 4, 5, '1793.85');

-- --------------------------------------------------------

--
-- 表的结构 `cart_extra`
--

CREATE TABLE `cart_extra` (
  `id` int(10) UNSIGNED NOT NULL,
  `gid` int(10) NOT NULL COMMENT '购物车中商品id',
  `num` int(10) NOT NULL COMMENT '购物车商品购物数量',
  `state` tinyint(10) NOT NULL DEFAULT '1' COMMENT '购物车中商品 状态  1选中 0未选中  ',
  `sid` int(10) NOT NULL COMMENT '关联购物id',
  `uid` int(10) NOT NULL COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart_extra`
--

INSERT INTO `cart_extra` (`id`, `gid`, `num`, `state`, `sid`, `uid`) VALUES
(22, 13, 2, 1, 9, 4),
(21, 12, 2, 1, 9, 4);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `cid` int(10) UNSIGNED NOT NULL,
  `cname` varchar(255) NOT NULL COMMENT '分类名称',
  `sort` int(10) NOT NULL COMMENT '排序',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`cid`, `cname`, `sort`, `pid`) VALUES
(1, '沙发', 10, 0),
(2, '茶几', 11, 0),
(3, '椅子', 12, 0),
(4, '冰箱', 13, 0),
(5, '皮沙发', 14, 1),
(6, '布艺沙发', 15, 1),
(7, '大理石茶几', 16, 2),
(16, '橱柜', 25, 0),
(15, '床', 20, 0),
(13, '新增栏目', 10, 8);

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `gid` int(10) UNSIGNED NOT NULL,
  `gname` varchar(255) NOT NULL COMMENT '商品名称',
  `gename` varchar(255) NOT NULL COMMENT '商品英文名',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `des` varchar(255) NOT NULL COMMENT '描述',
  `gbanner` varchar(255) NOT NULL COMMENT '轮播图 ',
  `gthumb` varchar(255) NOT NULL COMMENT '缩略图',
  `gcolor` varchar(255) NOT NULL COMMENT '多个颜色，拼接',
  `create_time` int(10) NOT NULL COMMENT '发布时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `gsize` varchar(255) NOT NULL COMMENT '规格',
  `gtype` varchar(255) NOT NULL COMMENT '种类',
  `gdel` varchar(255) NOT NULL COMMENT '配送信心',
  `gsales` int(10) NOT NULL DEFAULT '0' COMMENT '销量',
  `gdetail` varchar(255) NOT NULL COMMENT '商品详情',
  `gstock` int(10) NOT NULL COMMENT '库存',
  `cid` int(10) NOT NULL COMMENT '所属分类id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`gid`, `gname`, `gename`, `price`, `des`, `gbanner`, `gthumb`, `gcolor`, `create_time`, `update_time`, `gsize`, `gtype`, `gdel`, `gsales`, `gdetail`, `gstock`, `cid`) VALUES
(10, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(2, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(3, '精冠 现代简约美式布艺沙发床客厅双人坐卧两用双人小户型北欧简易懒人沙发', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546806, 1566546806, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(4, '塞纳春天 沙发床 沙发 新中式沙发床 实木推拉两用 多功能储物沙发 1.25m海绵款 降配不含储物箱', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546821, 1566546821, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(5, '佰志 沙发床 北欧多功能沙发床两用可折叠拆洗储物1.5米1.8米双三人推拉小户型客', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546840, 1566546840, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(6, '奥薇妮 沙发床两用多功能小户型客厅转角布艺沙发组合储物 R-01 2.9米【双+单+贵+踏】', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546853, 1566546853, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(7, '丛野 钢化玻璃茶几 简约茶几 茶桌 大小户型烤漆茶几 双层80*50 白腿+白面', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546906, 1566546906, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(8, '雅美乐 实木质感茶几 客厅简约双层大茶几桌 浅胡桃色 Y1422 100*50*42CM', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546920, 1566546920, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(9, '雅之神 茶几现代简约钢化玻璃茶几 茶桌小户型客厅创意茶几 储物茶几桌子 暖白色+黑玻璃 长120cm宽60cm高42cm', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546935, 1566546935, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(11, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(12, '精冠 现代简约美式布艺沙发床客厅双人坐卧两用双人小户型北欧简易懒人沙发', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546806, 1566546806, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(13, '塞纳春天 沙发床 沙发 新中式沙发床 实木推拉两用 多功能储物沙发 1.25m海绵款 降配不含储物箱', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546821, 1566546821, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(14, '佰志 沙发床 北欧多功能沙发床两用可折叠拆洗储物1.5米1.8米双三人推拉小户型客', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546840, 1566546840, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(15, '奥薇妮 沙发床两用多功能小户型客厅转角布艺沙发组合储物 R-01 2.9米【双+单+贵+踏】', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546853, 1566546853, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(16, '丛野 钢化玻璃茶几 简约茶几 茶桌 大小户型烤漆茶几 双层80*50 白腿+白面', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546906, 1566546906, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(17, '雅美乐 实木质感茶几 客厅简约双层大茶几桌 浅胡桃色 Y1422 100*50*42CM', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546920, 1566546920, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(18, '雅之神 茶几现代简约钢化玻璃茶几 茶桌小户型客厅创意茶几 储物茶几桌子 暖白色+黑玻璃 长120cm宽60cm高42cm', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546935, 1566546935, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(19, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(20, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(21, '精冠 现代简约美式布艺沙发床客厅双人坐卧两用双人小户型北欧简易懒人沙发', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546806, 1566546806, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(22, '塞纳春天 沙发床 沙发 新中式沙发床 实木推拉两用 多功能储物沙发 1.25m海绵款 降配不含储物箱', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546821, 1566546821, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(23, '佰志 沙发床 北欧多功能沙发床两用可折叠拆洗储物1.5米1.8米双三人推拉小户型客', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546840, 1566546840, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(24, '奥薇妮 沙发床两用多功能小户型客厅转角布艺沙发组合储物 R-01 2.9米【双+单+贵+踏】', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546853, 1566546853, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(25, '丛野 钢化玻璃茶几 简约茶几 茶桌 大小户型烤漆茶几 双层80*50 白腿+白面', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546906, 1566546906, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(26, '雅美乐 实木质感茶几 客厅简约双层大茶几桌 浅胡桃色 Y1422 100*50*42CM', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546920, 1566546920, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(27, '雅之神 茶几现代简约钢化玻璃茶几 茶桌小户型客厅创意茶几 储物茶几桌子 暖白色+黑玻璃 长120cm宽60cm高42cm', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546935, 1566546935, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(28, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(29, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(30, '精冠 现代简约美式布艺沙发床客厅双人坐卧两用双人小户型北欧简易懒人沙发', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546806, 1566546806, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(31, '塞纳春天 沙发床 沙发 新中式沙发床 实木推拉两用 多功能储物沙发 1.25m海绵款 降配不含储物箱', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546821, 1566546821, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(32, '佰志 沙发床 北欧多功能沙发床两用可折叠拆洗储物1.5米1.8米双三人推拉小户型客', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546840, 1566546840, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(33, '奥薇妮 沙发床两用多功能小户型客厅转角布艺沙发组合储物 R-01 2.9米【双+单+贵+踏】', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546853, 1566546853, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(34, '丛野 钢化玻璃茶几 简约茶几 茶桌 大小户型烤漆茶几 双层80*50 白腿+白面', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546906, 1566546906, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(35, '雅美乐 实木质感茶几 客厅简约双层大茶几桌 浅胡桃色 Y1422 100*50*42CM', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546920, 1566546920, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(36, '雅之神 茶几现代简约钢化玻璃茶几 茶桌小户型客厅创意茶几 储物茶几桌子 暖白色+黑玻璃 长120cm宽60cm高42cm', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546935, 1566546935, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(37, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(38, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(39, '精冠 现代简约美式布艺沙发床客厅双人坐卧两用双人小户型北欧简易懒人沙发', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546806, 1566546806, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(40, '塞纳春天 沙发床 沙发 新中式沙发床 实木推拉两用 多功能储物沙发 1.25m海绵款 降配不含储物箱', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546821, 1566546821, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(41, '佰志 沙发床 北欧多功能沙发床两用可折叠拆洗储物1.5米1.8米双三人推拉小户型客', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546840, 1566546840, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(42, '奥薇妮 沙发床两用多功能小户型客厅转角布艺沙发组合储物 R-01 2.9米【双+单+贵+踏】', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546853, 1566546853, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1),
(43, '丛野 钢化玻璃茶几 简约茶几 茶桌 大小户型烤漆茶几 双层80*50 白腿+白面', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546906, 1566546906, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(44, '雅美乐 实木质感茶几 客厅简约双层大茶几桌 浅胡桃色 Y1422 100*50*42CM', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546920, 1566546920, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(45, '雅之神 茶几现代简约钢化玻璃茶几 茶桌小户型客厅创意茶几 储物茶几桌子 暖白色+黑玻璃 长120cm宽60cm高42cm', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546935, 1566546935, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 2),
(46, '徽月 多功能折叠沙发床两用三人小户型客厅布艺沙发简易双人组合懒人网红免洗科技布 plus尊享 爆款烟灰麻布 1.8米长2腰枕（木脚）', 'Subjectively inscribed Huiyue multi-functional folding sofa bed', '547.95', '小沙发很不错，买来当小床睡，放在避暑房里面的，房子不大，很合适，颜色也不错，耐脏很好，物流很快，他们家都是发的顺丰，重庆发货到收到还是四天，四的天早上九点多收到，很不错的', '\\uploads\\20190823\\5e197a2b0d3bae3bfb6a26adb44d0215.webp,\\uploads\\20190823\\da9d14315afd96deca0c8da5592afaef.webp,\\uploads\\20190823\\90fcea80954be2fde2dc89698ce64d61.webp', '\\uploads\\20190823\\e67059e73213766da67de725de5ef330.webp', '#409EFF,#67C23A,#E6A23C', 1566546732, 1566546732, '产品净重(kg） 35 组立尺寸（cm） 180 包装尺寸（cm） 180 商品承重（kg） 500', '多功能折叠沙发', '免费', 0, '\\uploads\\20190823\\84105459690ecffaa70bc74244e0a9f5.webp,\\uploads\\20190823\\4b6ce1a894052c04c272a75ce2898fe3.webp,\\uploads\\20190823\\1755efa78859651add9359f4fb9b59ef.webp', 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `username`, `password`) VALUES
(1, 'admin', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `oid` int(10) UNSIGNED NOT NULL,
  `ordernum` varchar(255) NOT NULL COMMENT '订单号',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `address` int(255) NOT NULL DEFAULT '1' COMMENT '下单地址',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `state` int(10) NOT NULL DEFAULT '0' COMMENT '订单状态  0 待付款  1 待发货  2 待收货 3 待评价 ',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '下单时间',
  `update_time` int(10) NOT NULL COMMENT '完成时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`oid`, `ordernum`, `uid`, `address`, `price`, `state`, `remark`, `create_time`, `update_time`) VALUES
(4, '15677520573782', 4, 1, '3287.70', 0, NULL, 1567752057, 1567752057),
(5, '15677528517398', 4, 1, '1643.85', 1, NULL, 1567752851, 1567752851),
(6, '15677567019938', 4, 1, '2191.80', 1, NULL, 1567756701, 1567756701),
(7, '15678167711272', 4, 1, '2191.80', 0, NULL, 1567816771, 1567816771);

-- --------------------------------------------------------

--
-- 表的结构 `orders_extra`
--

CREATE TABLE `orders_extra` (
  `id` int(10) UNSIGNED NOT NULL,
  `gid` int(10) NOT NULL COMMENT '订单对应的商品',
  `num` int(10) NOT NULL COMMENT '商品购买数量',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `ordernum` varchar(255) NOT NULL COMMENT '订单好'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单附表：订单商品详情';

--
-- 转存表中的数据 `orders_extra`
--

INSERT INTO `orders_extra` (`id`, `gid`, `num`, `uid`, `ordernum`) VALUES
(6, 3, 4, 4, '15677520573782'),
(5, 2, 2, 4, '15677520573782'),
(7, 5, 1, 4, '15677528517398'),
(8, 6, 2, 4, '15677528517398'),
(9, 5, 1, 4, '15677567019938'),
(10, 6, 3, 4, '15677567019938'),
(11, 9, 2, 4, '15678167711272'),
(12, 2, 2, 4, '15678167711272');

-- --------------------------------------------------------

--
-- 表的结构 `team`
--

CREATE TABLE `team` (
  `id` int(10) UNSIGNED NOT NULL,
  `tname` varchar(255) NOT NULL COMMENT '成员名字',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `des` varchar(255) NOT NULL COMMENT '成员描述',
  `cid` int(10) NOT NULL COMMENT '设计方向',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `exp` varchar(255) DEFAULT NULL COMMENT '工作经验'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `team`
--

INSERT INTO `team` (`id`, `tname`, `avatar`, `des`, `cid`, `create_time`, `update_time`, `exp`) VALUES
(1, '周小福', '\\uploads\\20190827\\9e736e58f09fd861c31dd2783bfb8ec4.jpg', '李大福简介', 3, 1566867434, 1566867434, '5年');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `uname` varchar(255) NOT NULL COMMENT '用户名',
  `phone` varchar(255) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `avatar` varchar(255) NOT NULL DEFAULT '/static/avatar.png' COMMENT '头像',
  `sex` tinyint(10) NOT NULL DEFAULT '0' COMMENT '性别   0 未设置   1 男  2 女',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `collect` varchar(255) DEFAULT NULL COMMENT '收藏',
  `create_time` int(10) NOT NULL COMMENT '注册时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`uid`, `uname`, `phone`, `password`, `avatar`, `sex`, `birthday`, `sign`, `collect`, `create_time`, `update_time`) VALUES
(1, 'iwtuy_1567146172', '1234567890', '123456789', '/static/avatar.png', 0, NULL, NULL, NULL, 1567146172, 1567146172),
(2, 'yrewt_1567146728', '1234567890', '123456789', '/static/avatar.png', 0, NULL, NULL, NULL, 1567146728, 1567146728),
(3, 'ruyiw_1567146788', '1234567890', '123456789', '/static/avatar.png', 0, NULL, NULL, NULL, 1567146788, 1567146788),
(4, 'wtery_1567146967', '12345678', 'fb73828d73d2a13e0d06cee865736baf', '/static/avatar.png', 0, NULL, NULL, '40,41,42,43,44', 1567146967, 1567146967),
(5, 'rwyqe_1567155308', '12345678', 'fb73828d73d2a13e0d06cee865736baf', '/static/avatar.png', 0, NULL, NULL, NULL, 1567155308, 1567155308),
(6, 'yiqtw_1567157651', '12345678', 'fb73828d73d2a13e0d06cee865736baf', '/static/avatar.png', 0, NULL, NULL, NULL, 1567157651, 1567157651),
(7, 'retuq_1567742281', '1234567890', 'fb73828d73d2a13e0d06cee865736baf', '/static/avatar.png', 0, NULL, NULL, NULL, 1567742281, 1567742281);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `cart_extra`
--
ALTER TABLE `cart_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `orders_extra`
--
ALTER TABLE `orders_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `sid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `cart_extra`
--
ALTER TABLE `cart_extra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `gid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- 使用表AUTO_INCREMENT `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `orders_extra`
--
ALTER TABLE `orders_extra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `team`
--
ALTER TABLE `team`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
