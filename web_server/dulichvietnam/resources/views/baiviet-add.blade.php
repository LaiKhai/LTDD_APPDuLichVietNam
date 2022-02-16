@extends('layouts.app')
@section('title')
Danh sách thông tin bài viết
@endsection
@section('Img')
<style>
    #Hinh img {
        padding: 10px;
        max-width: 300px;
    }
</style>
@endsection
@section('content-wrapper')
@parent
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Thêm bài viết mới</h4>
            <p class="card-description"> Hãy thêm bài viết mới vào đây !</p>
            <form class="forms-sample" method="POST" action="{{route('baiviet.store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="exampleInputName1">Tiêu đề</label>
                    <input name="tieude" type="text" class="form-control" id="exampleInputName1"
                        placeholder="Tiêu đề bài viết">
                    <br>
                    @if ($errors->has('tieude'))
                    <small style="color:red">{{$errors->first('tieude')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleTextarea1">Mô tả</label>
                    <textarea name="mota" class="form-control" id="exampleTextarea1" rows="4"></textarea><br>
                    @if ($errors->has('mota'))
                    <small style="color:red">{{$errors->first('mota')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleSelectGender">Thuộc địa danh</label>
                    <select class="form-control" name="dia_danhs_id" id="exampleSelectGender">
                        <option value=" ">--chọn địa danh--</option>
                        @foreach ($lstdiadanh as $diadanh)
                        <option value="{{$diadanh->id}}">{{$diadanh->tendiadanh}}</option>
                        @endforeach

                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleSelectGender">Tài Khoản</label>
                    <select class="form-control" name="user_id" id="exampleSelectGender">
                        <option value=" ">--chọn tên tài khoản--</option>
                        @foreach ($lstuser as $user)
                        <option value="{{$user->id}}">{{$user->email}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <div class="input-group col-xs-12 lst increment">
                        <input class="form-control" type="file" name="images[]" id="images" accept="image/*"
                            placeholder="Choose images" multiple>
                        <div class="input-group-btn">
                            <button id="add" class="btn btn-success" type="button"><i
                                    class="fldemo glyphicon glyphicon-plus"></i>Add</button>
                        </div>
                    </div>
                    <div class="clone hide">
                        <div id="remove" class="hdtuto control-group lst input-group" style="margin-top:10px">
                            <input type="file" name="images[]" class="myfrm form-control">
                            <div class="input-group-btn">
                                <button class="btn btn-danger" type="button"><i
                                        class="fldemo glyphicon glyphicon-remove"></i>
                                    Remove</button>
                            </div>
                        </div>
                    </div>
                    @if ($errors->has('hinhanh'))
                    <small style="color:red">{{$errors->first('hinhanh')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <div id="Hinh" src="{{asset('admin_view/assets/images/No_Image.png')}}" alt=""></div>
                </div>
                <div class="form-check form-check-flat form-check-primary">
                    <label class="form-check-label" for="trangthai">
                        <input type="checkbox" class="form-check-input" name="trangthai" value=1>Trạng thái</label>
                </div>
                <button type="submit" class="btn btn-primary mr-2">Thêm</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Thoát</a>
            </form>
        </div>
    </div>
</div>
@endsection
@section('Script')
<script>
    $(function() {
    // Multiple images preview with JavaScript
    var previewImages = function(input, imgPreviewPlaceholder) {
    if (input.files) {
    var filesAmount = input.files.length;
    for (i = 0; i < filesAmount; i++) {
    var reader = new FileReader();
    reader.onload = function(event) {
    $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(imgPreviewPlaceholder);
    }
    reader.readAsDataURL(input.files[i]);
    }
    }
    };
    $('#images').on('change', function() {
    previewImages(this, '#Hinh');
});
});
</script>
<script>
    $(document).ready(function() {
      $("#add").click(function(){ 
          var lsthmtl = $(".clone").html();
          $(".increment").after(lsthmtl);
      });
      $("body").on("click",".btn-danger",function(){ 
          $(this).parents("#remove").remove();
      });
    });
</script>
@endsection