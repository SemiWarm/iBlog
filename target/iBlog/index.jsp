<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:53
  Desc: 主页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bloggerName = (String) session.getAttribute("bloggerName");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/docs.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font-awesome.min.css">
    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
    <style>
        body {
            padding-top: 70px;
        }

        .iBlogContent {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 6;
        }

        .jumbotronContent {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
        }

        .vertical-align {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- 实现内补充 -->
        <div class="container-fluid">
            <!-- 头部 -->
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/">
                    <img alt="Brand" style="width: 32px;height: 18px"
                         src="<%=request.getContextPath()%>/static/images/iBlog.png">
                </a>
            </div>

            <!-- 右侧 -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<%=request.getContextPath()%>/">发现</a></li>
                    <li><a href="#">关注</a></li>
                </ul>

                <div class="navbar-right">
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-success navbar-btn" id="btnLogin"><i
                            class="fa fa-user"></i>&nbsp;&nbsp;登录
                    </a>
                    <ul id="dropdownMenu" class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                <%=bloggerName%>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;我的主页</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/quit"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;退出</a></li>
                            </ul>
                        </li>
                    </ul>
                    <button class="btn btn-warning navbar-btn" id="btnWriteBlog" style="margin-left: 10px"><i
                            class="fa fa-pencil"></i>&nbsp;&nbsp;写博客
                    </button>
                </div>

            </div>
        </div>

    </div>
</nav>


<!-- 内容区域 -->
<div class="container">
    <!-- 轮播 -->
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div id="iBlogCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#iBlogCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#iBlogCarousel" data-slide-to="1"></li>
                    <li data-target="#iBlogCarousel" data-slide-to="2"></li>
                    <li data-target="#iBlogCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="<%=request.getContextPath()%>/static/images/girl_01.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>...</h3>
                            <p>...</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="<%=request.getContextPath()%>/static/images/girl_02.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>...</h3>
                            <p>...</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="<%=request.getContextPath()%>/static/images/girl_03.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>...</h3>
                            <p>...</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="<%=request.getContextPath()%>/static/images/girl_04.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>...</h3>
                            <p>...</p>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#iBlogCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#iBlogCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>

    <!-- 巨幕 -->

    <div class="row" style="padding-top: 20px">
        <div class="col-lg-10 col-lg-offset-1">
            <!-- 巨幕 -->
            <div class="jumbotron">
                <h2>你若安好，四季常春</h2>
                <p class="jumbotronContent">
                    一觉醒来已经是拂晓时分，揉揉惺忪的眼睛，一抹从窗外撇进来的明亮的月光，驱赶走了所有的睡意。房间里的一切仿佛在一夜之间也改变了许多，不再是原来熟悉的样子，可那些摆设依然还在，现在却感觉到非常陌生。怎么会出现这样的现象呢?是不是自己这颗快要跳出来的心还停留在梦见了无数次的梦境里?是不是屋里看不到那个魂牵梦绕的风雨丽人，而让整个房间变得既陌生又熟悉了呢?抽了张纸巾擦擦眼睛，下床推开窗户，一股浓郁的四季桂的幽香迎面扑来，也没商量一下便占据了我的所有空间，满屋子里的思念被稀释了点。早醒的鸟雀们在绿叶丛中欢快的跳跃着，叽叽喳喳的叫个不停，它们的世界我不懂，似佛永远都没有烦恼和忧愁。不像人类会有太多想不完的心事，家长里短爱恨情仇，俗世间的烟火百味，冲刺着只有拳头般大小的心胀，能有几个真正做到知足常乐呀?迫于无奈只好学会把自己灌醉，把自己的内心深处的世界给隐藏起来，于是乎，用强颜欢笑来伪装自己的无处可诉的忧伤和惆怅。

                    窗外的月色皎洁撩人，新长出来的绿叶成阴阑珊，一片片飘落在地的桃花瓣静静地呆在树荫下，将和雨露一起腐烂变成一捧更护花的春泥。花开花落自然坦荡不遮不掩，开得芬芳，落得洒脱，回眸一笑百媚生，把明媚的阳光留给颗颗青果。一次生命轮回，一次艳与败的经历，短暂的花季里芳香了春色，扮靓了春意。月光投影，可照不出你的影子，我望落了十里桃花，望穿了一江春水向东流，望开了一树梨花带雨。朦胧细雨带走花叶上的尘埃，让红的更红，让白的更白，也让我充满思念的心湖飘荡起清香的空气。花香和思念的人在心里蹁跹，共舞一曲红尘之恋，爱在心湖里燃烧，沸腾了心血，眷念四处蔓延。月光开始暗淡消退，月亮仙子把春天的舞台让给太阳公公，房间里渐渐的明亮，绯红色的朝霞悄悄地嵌入四壁，新的一天又开始了。时光在静静地流淌，悄无声息的从每个人的脸颊上流过，留下了一道一道被侵蚀的痕迹，除此之外就是一颗在挣扎的心脏。无奈两心相悦的人却各分东西，现实生活中造化弄人，事实与世俗在抗衡，虚伪与真诚在比拼，世外桃园也只不过是想像中的一块净地而已。虽说如此，可我相信只要挚爱长存，信念不消，就肯定会有拨云见日的那一天，不管遇到怎样的坎坎坷坷，都应该坚守自己的那颗真诚的心，才能厚德载物，才是永恒不变的主题。

                    虽然四月的清晨还存留一丝冷意，但风儿吹到脸上已是非常舒服了，轻轻柔柔真是吹面不寒杨柳风。刚绿起来的白杨树的心形的新叶随风摇曳，一串串杨蕾开始抽絮，一朵朵雪白的杨柳絮漫天飞舞，就像飘起了雪花一样。一树梨花开的正艳，粉白色的小花沐浴朝霞，羞羞答答文静优雅，继桃花后把春色点缀得更浓。带着心里的影子爱人，漫步潜行在林荫阡陌上，张开双臂抱一怀火红的朝霞，把对你的牵念融入每一缕霞光。摘一片心叶放在胸前，把灿烂的春色画在你的眉间，让有你的世界永远都是春天。亲爱的，你知不知道我又在想你了吗?每当想你的时候，我会将身心与自然交融，让每一朵花每一棵草每一片云彩每一缕阳光，都能感觉到我的心在为你跳动。每当想你的时候，我会静静地守候在时光渡口，等待着和你重逢，轻抚你的秀发，紧握你纤细的双手。每当想你的时候，我会为你唱起《我的快乐就是想你》，想你让我品尝到心有所属的甜蜜。我应该感谢苍天，让我在滚滚红尘中遇到了你，我应该感谢命运，让我在茫茫人海里走进了你的世界，拥有你的爱此生无憾。

                    四月暖阳露出红彤彤的笑脸，凡世间里的一切都被她亲吻着，青山绿水风和日丽，牛羊悠闲自得啃食着嫩嫩的青草，青蛙在池塘里引吭高歌，大声朗诵爱的宣言，是谁的神笔描绘出这副如此多娇的田园春色?又是谁让岁月如此美丽安然静好?真想挽留时光流逝的脚步，真想让岁月就此搁浅，更想能和你在属于我们的庭院里，同煮一壶清茶，共赏春花秋月。不求来生来世，只愿今生能执子之手与子偕老，今世的遇见是前世修来的缘，缘让面如桃花心如莲的你走进了我的左心房，你在心间爱在心田。四月艳阳高照暖风轻拂，莺歌燕舞柳絮飞扬，原来一切美好的场景都因为有你而变得璀璨夺目，你是月亮仙子的化身，你是我最爱的风雨丽人。捻一片洁白的四月飞雪，在每一根丝絮上写满爱你念你的心语心愿，再迎着朝阳放飞，让它载着我的思念飞跃巅峰山涧，飞到你身边，飞进你那清澈的心河里，绿水潺潺情意绵绵。

                    四月里柔情的风吹青了大江南北，也吹散了三月烟花，让时节步入了晚春，随着时间的推移，当繁花落尽青果攀枝的时候，春天快要远行。漠然回首，今年多彩的花季又将成为美好的回忆，回忆那十里桃花一树梨白，回忆那小桥流水花前月下，回忆那欣喜若狂的相逢。相见时难别亦难，每走近一步心血沸腾，每远离一步心如刀割。即便这样只要你一声呼唤，我就会不远千山万水飞奔过来，与你相依相偎携手流年。有你岁月如歌，你若安好四季常春，我的笔尖写不完四季的美景，抒不尽热恋你的情怀。只有把你写进文字里，才能与你永远长相依，三月烟花见证了今世情缘，四月飞雪寄托今生眷念。</p>
                <p><a class="btn btn-default" href="#" role="button">查看更多</a></p>
            </div>
        </div>
    </div>

    <!-- 博文 -->

    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">

            <!-- 1 -->
            <div class="row">
                <hr>
                <div class="row vertical-align">
                    <div class="col-lg-1">
                        <img class="img-circle" src="<%=request.getContextPath()%>/static/images/user.jpg" alt="用户"
                             style="width: 50px;height: 50px;">
                    </div>
                    <div class="col-lg-2">
                        <label class="label label-success">风吹裙起屁屁凉</label>
                    </div>
                </div>

                <div class="row vertical-align">
                    <div class="col-lg-12">
                        <div class="bs-callout">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h4>你若安好，四季常春</h4>
                                    <p class="iBlogContent">
                                        一觉醒来已经是拂晓时分，揉揉惺忪的眼睛，一抹从窗外撇进来的明亮的月光，驱赶走了所有的睡意。房间里的一切仿佛在一夜之间也改变了许多，不再是原来熟悉的样子，可那些摆设依然还在，现在却感觉到非常陌生。怎么会出现这样的现象呢?是不是自己这颗快要跳出来的心还停留在梦见了无数次的梦境里?是不是屋里看不到那个魂牵梦绕的风雨丽人，而让整个房间变得既陌生又熟悉了呢?抽了张纸巾擦擦眼睛，下床推开窗户，一股浓郁的四季桂的幽香迎面扑来，也没商量一下便占据了我的所有空间，满屋子里的思念被稀释了点。早醒的鸟雀们在绿叶丛中欢快的跳跃着，叽叽喳喳的叫个不停，它们的世界我不懂，似佛永远都没有烦恼和忧愁。不像人类会有太多想不完的心事，家长里短爱恨情仇，俗世间的烟火百味，冲刺着只有拳头般大小的心胀，能有几个真正做到知足常乐呀?迫于无奈只好学会把自己灌醉，把自己的内心深处的世界给隐藏起来，于是乎，用强颜欢笑来伪装自己的无处可诉的忧伤和惆怅。

                                        窗外的月色皎洁撩人，新长出来的绿叶成阴阑珊，一片片飘落在地的桃花瓣静静地呆在树荫下，将和雨露一起腐烂变成一捧更护花的春泥。花开花落自然坦荡不遮不掩，开得芬芳，落得洒脱，回眸一笑百媚生，把明媚的阳光留给颗颗青果。一次生命轮回，一次艳与败的经历，短暂的花季里芳香了春色，扮靓了春意。月光投影，可照不出你的影子，我望落了十里桃花，望穿了一江春水向东流，望开了一树梨花带雨。朦胧细雨带走花叶上的尘埃，让红的更红，让白的更白，也让我充满思念的心湖飘荡起清香的空气。花香和思念的人在心里蹁跹，共舞一曲红尘之恋，爱在心湖里燃烧，沸腾了心血，眷念四处蔓延。月光开始暗淡消退，月亮仙子把春天的舞台让给太阳公公，房间里渐渐的明亮，绯红色的朝霞悄悄地嵌入四壁，新的一天又开始了。时光在静静地流淌，悄无声息的从每个人的脸颊上流过，留下了一道一道被侵蚀的痕迹，除此之外就是一颗在挣扎的心脏。无奈两心相悦的人却各分东西，现实生活中造化弄人，事实与世俗在抗衡，虚伪与真诚在比拼，世外桃园也只不过是想像中的一块净地而已。虽说如此，可我相信只要挚爱长存，信念不消，就肯定会有拨云见日的那一天，不管遇到怎样的坎坎坷坷，都应该坚守自己的那颗真诚的心，才能厚德载物，才是永恒不变的主题。

                                        虽然四月的清晨还存留一丝冷意，但风儿吹到脸上已是非常舒服了，轻轻柔柔真是吹面不寒杨柳风。刚绿起来的白杨树的心形的新叶随风摇曳，一串串杨蕾开始抽絮，一朵朵雪白的杨柳絮漫天飞舞，就像飘起了雪花一样。一树梨花开的正艳，粉白色的小花沐浴朝霞，羞羞答答文静优雅，继桃花后把春色点缀得更浓。带着心里的影子爱人，漫步潜行在林荫阡陌上，张开双臂抱一怀火红的朝霞，把对你的牵念融入每一缕霞光。摘一片心叶放在胸前，把灿烂的春色画在你的眉间，让有你的世界永远都是春天。亲爱的，你知不知道我又在想你了吗?每当想你的时候，我会将身心与自然交融，让每一朵花每一棵草每一片云彩每一缕阳光，都能感觉到我的心在为你跳动。每当想你的时候，我会静静地守候在时光渡口，等待着和你重逢，轻抚你的秀发，紧握你纤细的双手。每当想你的时候，我会为你唱起《我的快乐就是想你》，想你让我品尝到心有所属的甜蜜。我应该感谢苍天，让我在滚滚红尘中遇到了你，我应该感谢命运，让我在茫茫人海里走进了你的世界，拥有你的爱此生无憾。

                                        四月暖阳露出红彤彤的笑脸，凡世间里的一切都被她亲吻着，青山绿水风和日丽，牛羊悠闲自得啃食着嫩嫩的青草，青蛙在池塘里引吭高歌，大声朗诵爱的宣言，是谁的神笔描绘出这副如此多娇的田园春色?又是谁让岁月如此美丽安然静好?真想挽留时光流逝的脚步，真想让岁月就此搁浅，更想能和你在属于我们的庭院里，同煮一壶清茶，共赏春花秋月。不求来生来世，只愿今生能执子之手与子偕老，今世的遇见是前世修来的缘，缘让面如桃花心如莲的你走进了我的左心房，你在心间爱在心田。四月艳阳高照暖风轻拂，莺歌燕舞柳絮飞扬，原来一切美好的场景都因为有你而变得璀璨夺目，你是月亮仙子的化身，你是我最爱的风雨丽人。捻一片洁白的四月飞雪，在每一根丝絮上写满爱你念你的心语心愿，再迎着朝阳放飞，让它载着我的思念飞跃巅峰山涧，飞到你身边，飞进你那清澈的心河里，绿水潺潺情意绵绵。

                                        四月里柔情的风吹青了大江南北，也吹散了三月烟花，让时节步入了晚春，随着时间的推移，当繁花落尽青果攀枝的时候，春天快要远行。漠然回首，今年多彩的花季又将成为美好的回忆，回忆那十里桃花一树梨白，回忆那小桥流水花前月下，回忆那欣喜若狂的相逢。相见时难别亦难，每走近一步心血沸腾，每远离一步心如刀割。即便这样只要你一声呼唤，我就会不远千山万水飞奔过来，与你相依相偎携手流年。有你岁月如歌，你若安好四季常春，我的笔尖写不完四季的美景，抒不尽热恋你的情怀。只有把你写进文字里，才能与你永远长相依，三月烟花见证了今世情缘，四月飞雪寄托今生眷念。
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <img class="img-thumbnail"
                                         src="<%=request.getContextPath()%>/static/images/thum.png">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="label label-danger">@程序员&nbsp;@散文&nbsp;@热点</label>&nbsp;
                                    <i class="fa fa-eye text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-bookmark-o text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-commenting-o text-muted">&nbsp;500</i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 2 -->
            <div class="row">
                <hr>
                <div class="row vertical-align">
                    <div class="col-lg-1">
                        <img class="img-circle" src="<%=request.getContextPath()%>/static/images/user.jpg" alt="用户"
                             style="width: 50px;height: 50px;">
                    </div>
                    <div class="col-lg-2">
                        <label class="label label-success">风吹裙起屁屁凉</label>
                    </div>
                </div>

                <div class="row vertical-align">
                    <div class="col-lg-12">
                        <div class="bs-callout bs-callout-info">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h4>你若安好，四季常春</h4>
                                    <p class="iBlogContent">
                                        一觉醒来已经是拂晓时分，揉揉惺忪的眼睛，一抹从窗外撇进来的明亮的月光，驱赶走了所有的睡意。房间里的一切仿佛在一夜之间也改变了许多，不再是原来熟悉的样子，可那些摆设依然还在，现在却感觉到非常陌生。怎么会出现这样的现象呢?是不是自己这颗快要跳出来的心还停留在梦见了无数次的梦境里?是不是屋里看不到那个魂牵梦绕的风雨丽人，而让整个房间变得既陌生又熟悉了呢?抽了张纸巾擦擦眼睛，下床推开窗户，一股浓郁的四季桂的幽香迎面扑来，也没商量一下便占据了我的所有空间，满屋子里的思念被稀释了点。早醒的鸟雀们在绿叶丛中欢快的跳跃着，叽叽喳喳的叫个不停，它们的世界我不懂，似佛永远都没有烦恼和忧愁。不像人类会有太多想不完的心事，家长里短爱恨情仇，俗世间的烟火百味，冲刺着只有拳头般大小的心胀，能有几个真正做到知足常乐呀?迫于无奈只好学会把自己灌醉，把自己的内心深处的世界给隐藏起来，于是乎，用强颜欢笑来伪装自己的无处可诉的忧伤和惆怅。

                                        窗外的月色皎洁撩人，新长出来的绿叶成阴阑珊，一片片飘落在地的桃花瓣静静地呆在树荫下，将和雨露一起腐烂变成一捧更护花的春泥。花开花落自然坦荡不遮不掩，开得芬芳，落得洒脱，回眸一笑百媚生，把明媚的阳光留给颗颗青果。一次生命轮回，一次艳与败的经历，短暂的花季里芳香了春色，扮靓了春意。月光投影，可照不出你的影子，我望落了十里桃花，望穿了一江春水向东流，望开了一树梨花带雨。朦胧细雨带走花叶上的尘埃，让红的更红，让白的更白，也让我充满思念的心湖飘荡起清香的空气。花香和思念的人在心里蹁跹，共舞一曲红尘之恋，爱在心湖里燃烧，沸腾了心血，眷念四处蔓延。月光开始暗淡消退，月亮仙子把春天的舞台让给太阳公公，房间里渐渐的明亮，绯红色的朝霞悄悄地嵌入四壁，新的一天又开始了。时光在静静地流淌，悄无声息的从每个人的脸颊上流过，留下了一道一道被侵蚀的痕迹，除此之外就是一颗在挣扎的心脏。无奈两心相悦的人却各分东西，现实生活中造化弄人，事实与世俗在抗衡，虚伪与真诚在比拼，世外桃园也只不过是想像中的一块净地而已。虽说如此，可我相信只要挚爱长存，信念不消，就肯定会有拨云见日的那一天，不管遇到怎样的坎坎坷坷，都应该坚守自己的那颗真诚的心，才能厚德载物，才是永恒不变的主题。

                                        虽然四月的清晨还存留一丝冷意，但风儿吹到脸上已是非常舒服了，轻轻柔柔真是吹面不寒杨柳风。刚绿起来的白杨树的心形的新叶随风摇曳，一串串杨蕾开始抽絮，一朵朵雪白的杨柳絮漫天飞舞，就像飘起了雪花一样。一树梨花开的正艳，粉白色的小花沐浴朝霞，羞羞答答文静优雅，继桃花后把春色点缀得更浓。带着心里的影子爱人，漫步潜行在林荫阡陌上，张开双臂抱一怀火红的朝霞，把对你的牵念融入每一缕霞光。摘一片心叶放在胸前，把灿烂的春色画在你的眉间，让有你的世界永远都是春天。亲爱的，你知不知道我又在想你了吗?每当想你的时候，我会将身心与自然交融，让每一朵花每一棵草每一片云彩每一缕阳光，都能感觉到我的心在为你跳动。每当想你的时候，我会静静地守候在时光渡口，等待着和你重逢，轻抚你的秀发，紧握你纤细的双手。每当想你的时候，我会为你唱起《我的快乐就是想你》，想你让我品尝到心有所属的甜蜜。我应该感谢苍天，让我在滚滚红尘中遇到了你，我应该感谢命运，让我在茫茫人海里走进了你的世界，拥有你的爱此生无憾。

                                        四月暖阳露出红彤彤的笑脸，凡世间里的一切都被她亲吻着，青山绿水风和日丽，牛羊悠闲自得啃食着嫩嫩的青草，青蛙在池塘里引吭高歌，大声朗诵爱的宣言，是谁的神笔描绘出这副如此多娇的田园春色?又是谁让岁月如此美丽安然静好?真想挽留时光流逝的脚步，真想让岁月就此搁浅，更想能和你在属于我们的庭院里，同煮一壶清茶，共赏春花秋月。不求来生来世，只愿今生能执子之手与子偕老，今世的遇见是前世修来的缘，缘让面如桃花心如莲的你走进了我的左心房，你在心间爱在心田。四月艳阳高照暖风轻拂，莺歌燕舞柳絮飞扬，原来一切美好的场景都因为有你而变得璀璨夺目，你是月亮仙子的化身，你是我最爱的风雨丽人。捻一片洁白的四月飞雪，在每一根丝絮上写满爱你念你的心语心愿，再迎着朝阳放飞，让它载着我的思念飞跃巅峰山涧，飞到你身边，飞进你那清澈的心河里，绿水潺潺情意绵绵。

                                        四月里柔情的风吹青了大江南北，也吹散了三月烟花，让时节步入了晚春，随着时间的推移，当繁花落尽青果攀枝的时候，春天快要远行。漠然回首，今年多彩的花季又将成为美好的回忆，回忆那十里桃花一树梨白，回忆那小桥流水花前月下，回忆那欣喜若狂的相逢。相见时难别亦难，每走近一步心血沸腾，每远离一步心如刀割。即便这样只要你一声呼唤，我就会不远千山万水飞奔过来，与你相依相偎携手流年。有你岁月如歌，你若安好四季常春，我的笔尖写不完四季的美景，抒不尽热恋你的情怀。只有把你写进文字里，才能与你永远长相依，三月烟花见证了今世情缘，四月飞雪寄托今生眷念。
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <img class="img-thumbnail"
                                         src="<%=request.getContextPath()%>/static/images/thum.png">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="label label-danger">@程序员&nbsp;@散文&nbsp;@热点</label>&nbsp;
                                    <i class="fa fa-eye text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-bookmark-o text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-commenting-o text-muted">&nbsp;500</i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 3 -->
            <div class="row">
                <hr>
                <div class="row vertical-align">
                    <div class="col-lg-1">
                        <img class="img-circle" src="<%=request.getContextPath()%>/static/images/user.jpg" alt="用户"
                             style="width: 50px;height: 50px;">
                    </div>
                    <div class="col-lg-2">
                        <label class="label label-success">风吹裙起屁屁凉</label>
                    </div>
                </div>

                <div class="row vertical-align">
                    <div class="col-lg-12">
                        <div class="bs-callout bs-callout-danger">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h4>你若安好，四季常春</h4>
                                    <p class="iBlogContent">
                                        一觉醒来已经是拂晓时分，揉揉惺忪的眼睛，一抹从窗外撇进来的明亮的月光，驱赶走了所有的睡意。房间里的一切仿佛在一夜之间也改变了许多，不再是原来熟悉的样子，可那些摆设依然还在，现在却感觉到非常陌生。怎么会出现这样的现象呢?是不是自己这颗快要跳出来的心还停留在梦见了无数次的梦境里?是不是屋里看不到那个魂牵梦绕的风雨丽人，而让整个房间变得既陌生又熟悉了呢?抽了张纸巾擦擦眼睛，下床推开窗户，一股浓郁的四季桂的幽香迎面扑来，也没商量一下便占据了我的所有空间，满屋子里的思念被稀释了点。早醒的鸟雀们在绿叶丛中欢快的跳跃着，叽叽喳喳的叫个不停，它们的世界我不懂，似佛永远都没有烦恼和忧愁。不像人类会有太多想不完的心事，家长里短爱恨情仇，俗世间的烟火百味，冲刺着只有拳头般大小的心胀，能有几个真正做到知足常乐呀?迫于无奈只好学会把自己灌醉，把自己的内心深处的世界给隐藏起来，于是乎，用强颜欢笑来伪装自己的无处可诉的忧伤和惆怅。

                                        窗外的月色皎洁撩人，新长出来的绿叶成阴阑珊，一片片飘落在地的桃花瓣静静地呆在树荫下，将和雨露一起腐烂变成一捧更护花的春泥。花开花落自然坦荡不遮不掩，开得芬芳，落得洒脱，回眸一笑百媚生，把明媚的阳光留给颗颗青果。一次生命轮回，一次艳与败的经历，短暂的花季里芳香了春色，扮靓了春意。月光投影，可照不出你的影子，我望落了十里桃花，望穿了一江春水向东流，望开了一树梨花带雨。朦胧细雨带走花叶上的尘埃，让红的更红，让白的更白，也让我充满思念的心湖飘荡起清香的空气。花香和思念的人在心里蹁跹，共舞一曲红尘之恋，爱在心湖里燃烧，沸腾了心血，眷念四处蔓延。月光开始暗淡消退，月亮仙子把春天的舞台让给太阳公公，房间里渐渐的明亮，绯红色的朝霞悄悄地嵌入四壁，新的一天又开始了。时光在静静地流淌，悄无声息的从每个人的脸颊上流过，留下了一道一道被侵蚀的痕迹，除此之外就是一颗在挣扎的心脏。无奈两心相悦的人却各分东西，现实生活中造化弄人，事实与世俗在抗衡，虚伪与真诚在比拼，世外桃园也只不过是想像中的一块净地而已。虽说如此，可我相信只要挚爱长存，信念不消，就肯定会有拨云见日的那一天，不管遇到怎样的坎坎坷坷，都应该坚守自己的那颗真诚的心，才能厚德载物，才是永恒不变的主题。

                                        虽然四月的清晨还存留一丝冷意，但风儿吹到脸上已是非常舒服了，轻轻柔柔真是吹面不寒杨柳风。刚绿起来的白杨树的心形的新叶随风摇曳，一串串杨蕾开始抽絮，一朵朵雪白的杨柳絮漫天飞舞，就像飘起了雪花一样。一树梨花开的正艳，粉白色的小花沐浴朝霞，羞羞答答文静优雅，继桃花后把春色点缀得更浓。带着心里的影子爱人，漫步潜行在林荫阡陌上，张开双臂抱一怀火红的朝霞，把对你的牵念融入每一缕霞光。摘一片心叶放在胸前，把灿烂的春色画在你的眉间，让有你的世界永远都是春天。亲爱的，你知不知道我又在想你了吗?每当想你的时候，我会将身心与自然交融，让每一朵花每一棵草每一片云彩每一缕阳光，都能感觉到我的心在为你跳动。每当想你的时候，我会静静地守候在时光渡口，等待着和你重逢，轻抚你的秀发，紧握你纤细的双手。每当想你的时候，我会为你唱起《我的快乐就是想你》，想你让我品尝到心有所属的甜蜜。我应该感谢苍天，让我在滚滚红尘中遇到了你，我应该感谢命运，让我在茫茫人海里走进了你的世界，拥有你的爱此生无憾。

                                        四月暖阳露出红彤彤的笑脸，凡世间里的一切都被她亲吻着，青山绿水风和日丽，牛羊悠闲自得啃食着嫩嫩的青草，青蛙在池塘里引吭高歌，大声朗诵爱的宣言，是谁的神笔描绘出这副如此多娇的田园春色?又是谁让岁月如此美丽安然静好?真想挽留时光流逝的脚步，真想让岁月就此搁浅，更想能和你在属于我们的庭院里，同煮一壶清茶，共赏春花秋月。不求来生来世，只愿今生能执子之手与子偕老，今世的遇见是前世修来的缘，缘让面如桃花心如莲的你走进了我的左心房，你在心间爱在心田。四月艳阳高照暖风轻拂，莺歌燕舞柳絮飞扬，原来一切美好的场景都因为有你而变得璀璨夺目，你是月亮仙子的化身，你是我最爱的风雨丽人。捻一片洁白的四月飞雪，在每一根丝絮上写满爱你念你的心语心愿，再迎着朝阳放飞，让它载着我的思念飞跃巅峰山涧，飞到你身边，飞进你那清澈的心河里，绿水潺潺情意绵绵。

                                        四月里柔情的风吹青了大江南北，也吹散了三月烟花，让时节步入了晚春，随着时间的推移，当繁花落尽青果攀枝的时候，春天快要远行。漠然回首，今年多彩的花季又将成为美好的回忆，回忆那十里桃花一树梨白，回忆那小桥流水花前月下，回忆那欣喜若狂的相逢。相见时难别亦难，每走近一步心血沸腾，每远离一步心如刀割。即便这样只要你一声呼唤，我就会不远千山万水飞奔过来，与你相依相偎携手流年。有你岁月如歌，你若安好四季常春，我的笔尖写不完四季的美景，抒不尽热恋你的情怀。只有把你写进文字里，才能与你永远长相依，三月烟花见证了今世情缘，四月飞雪寄托今生眷念。
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <img class="img-thumbnail"
                                         src="<%=request.getContextPath()%>/static/images/thum.png">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="label label-danger">@程序员&nbsp;@散文&nbsp;@热点</label>&nbsp;
                                    <i class="fa fa-eye text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-bookmark-o text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-commenting-o text-muted">&nbsp;500</i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 4 -->
            <div class="row">
                <hr>
                <div class="row vertical-align">
                    <div class="col-lg-1">
                        <img class="img-circle" src="<%=request.getContextPath()%>/static/images/user.jpg" alt="用户"
                             style="width: 50px;height: 50px;">
                    </div>
                    <div class="col-lg-2">
                        <label class="label label-success">风吹裙起屁屁凉</label>
                    </div>
                </div>

                <div class="row vertical-align">
                    <div class="col-lg-12">
                        <div class="bs-callout bs-callout-warning">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h4>你若安好，四季常春</h4>
                                    <p class="iBlogContent">
                                        一觉醒来已经是拂晓时分，揉揉惺忪的眼睛，一抹从窗外撇进来的明亮的月光，驱赶走了所有的睡意。房间里的一切仿佛在一夜之间也改变了许多，不再是原来熟悉的样子，可那些摆设依然还在，现在却感觉到非常陌生。怎么会出现这样的现象呢?是不是自己这颗快要跳出来的心还停留在梦见了无数次的梦境里?是不是屋里看不到那个魂牵梦绕的风雨丽人，而让整个房间变得既陌生又熟悉了呢?抽了张纸巾擦擦眼睛，下床推开窗户，一股浓郁的四季桂的幽香迎面扑来，也没商量一下便占据了我的所有空间，满屋子里的思念被稀释了点。早醒的鸟雀们在绿叶丛中欢快的跳跃着，叽叽喳喳的叫个不停，它们的世界我不懂，似佛永远都没有烦恼和忧愁。不像人类会有太多想不完的心事，家长里短爱恨情仇，俗世间的烟火百味，冲刺着只有拳头般大小的心胀，能有几个真正做到知足常乐呀?迫于无奈只好学会把自己灌醉，把自己的内心深处的世界给隐藏起来，于是乎，用强颜欢笑来伪装自己的无处可诉的忧伤和惆怅。

                                        窗外的月色皎洁撩人，新长出来的绿叶成阴阑珊，一片片飘落在地的桃花瓣静静地呆在树荫下，将和雨露一起腐烂变成一捧更护花的春泥。花开花落自然坦荡不遮不掩，开得芬芳，落得洒脱，回眸一笑百媚生，把明媚的阳光留给颗颗青果。一次生命轮回，一次艳与败的经历，短暂的花季里芳香了春色，扮靓了春意。月光投影，可照不出你的影子，我望落了十里桃花，望穿了一江春水向东流，望开了一树梨花带雨。朦胧细雨带走花叶上的尘埃，让红的更红，让白的更白，也让我充满思念的心湖飘荡起清香的空气。花香和思念的人在心里蹁跹，共舞一曲红尘之恋，爱在心湖里燃烧，沸腾了心血，眷念四处蔓延。月光开始暗淡消退，月亮仙子把春天的舞台让给太阳公公，房间里渐渐的明亮，绯红色的朝霞悄悄地嵌入四壁，新的一天又开始了。时光在静静地流淌，悄无声息的从每个人的脸颊上流过，留下了一道一道被侵蚀的痕迹，除此之外就是一颗在挣扎的心脏。无奈两心相悦的人却各分东西，现实生活中造化弄人，事实与世俗在抗衡，虚伪与真诚在比拼，世外桃园也只不过是想像中的一块净地而已。虽说如此，可我相信只要挚爱长存，信念不消，就肯定会有拨云见日的那一天，不管遇到怎样的坎坎坷坷，都应该坚守自己的那颗真诚的心，才能厚德载物，才是永恒不变的主题。

                                        虽然四月的清晨还存留一丝冷意，但风儿吹到脸上已是非常舒服了，轻轻柔柔真是吹面不寒杨柳风。刚绿起来的白杨树的心形的新叶随风摇曳，一串串杨蕾开始抽絮，一朵朵雪白的杨柳絮漫天飞舞，就像飘起了雪花一样。一树梨花开的正艳，粉白色的小花沐浴朝霞，羞羞答答文静优雅，继桃花后把春色点缀得更浓。带着心里的影子爱人，漫步潜行在林荫阡陌上，张开双臂抱一怀火红的朝霞，把对你的牵念融入每一缕霞光。摘一片心叶放在胸前，把灿烂的春色画在你的眉间，让有你的世界永远都是春天。亲爱的，你知不知道我又在想你了吗?每当想你的时候，我会将身心与自然交融，让每一朵花每一棵草每一片云彩每一缕阳光，都能感觉到我的心在为你跳动。每当想你的时候，我会静静地守候在时光渡口，等待着和你重逢，轻抚你的秀发，紧握你纤细的双手。每当想你的时候，我会为你唱起《我的快乐就是想你》，想你让我品尝到心有所属的甜蜜。我应该感谢苍天，让我在滚滚红尘中遇到了你，我应该感谢命运，让我在茫茫人海里走进了你的世界，拥有你的爱此生无憾。

                                        四月暖阳露出红彤彤的笑脸，凡世间里的一切都被她亲吻着，青山绿水风和日丽，牛羊悠闲自得啃食着嫩嫩的青草，青蛙在池塘里引吭高歌，大声朗诵爱的宣言，是谁的神笔描绘出这副如此多娇的田园春色?又是谁让岁月如此美丽安然静好?真想挽留时光流逝的脚步，真想让岁月就此搁浅，更想能和你在属于我们的庭院里，同煮一壶清茶，共赏春花秋月。不求来生来世，只愿今生能执子之手与子偕老，今世的遇见是前世修来的缘，缘让面如桃花心如莲的你走进了我的左心房，你在心间爱在心田。四月艳阳高照暖风轻拂，莺歌燕舞柳絮飞扬，原来一切美好的场景都因为有你而变得璀璨夺目，你是月亮仙子的化身，你是我最爱的风雨丽人。捻一片洁白的四月飞雪，在每一根丝絮上写满爱你念你的心语心愿，再迎着朝阳放飞，让它载着我的思念飞跃巅峰山涧，飞到你身边，飞进你那清澈的心河里，绿水潺潺情意绵绵。

                                        四月里柔情的风吹青了大江南北，也吹散了三月烟花，让时节步入了晚春，随着时间的推移，当繁花落尽青果攀枝的时候，春天快要远行。漠然回首，今年多彩的花季又将成为美好的回忆，回忆那十里桃花一树梨白，回忆那小桥流水花前月下，回忆那欣喜若狂的相逢。相见时难别亦难，每走近一步心血沸腾，每远离一步心如刀割。即便这样只要你一声呼唤，我就会不远千山万水飞奔过来，与你相依相偎携手流年。有你岁月如歌，你若安好四季常春，我的笔尖写不完四季的美景，抒不尽热恋你的情怀。只有把你写进文字里，才能与你永远长相依，三月烟花见证了今世情缘，四月飞雪寄托今生眷念。
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <img class="img-thumbnail"
                                         src="<%=request.getContextPath()%>/static/images/thum.png">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="label label-danger">@程序员&nbsp;@散文&nbsp;@热点</label>&nbsp;
                                    <i class="fa fa-eye text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-bookmark-o text-muted">&nbsp;500</i>&nbsp;
                                    <i class="fa fa-commenting-o text-muted">&nbsp;500</i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- more -->

            <div class="row">
                <hr>
                <div class="col-lg-12 btn btn-info" role="button">
                    加载更多
                </div>
            </div>

            <!-- footer -->
            <div class="row">
                <hr>

            </div>

        </div>
    </div>


</div>

<script type="text/javascript">
    var btnLogin = $('#btnLogin');
    var dropdownMenu = $('#dropdownMenu');
    var btnWriteBlog = $('#btnWriteBlog');
    $(function () {
        var bloggerName = '<%=bloggerName%>';
        if (bloggerName === 'null') {
            dropdownMenu.css("display", "none");
        } else {
            btnLogin.css("display", "none");
        }
    });

    btnWriteBlog.bind('click', function () {
        window.open("<%=request.getContextPath()%>/editor", "_blank");
    });
</script>
</body>
</html>
