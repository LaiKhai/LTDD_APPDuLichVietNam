@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Thêm địa danh mới</h4>
            <p class="card-description"> Hãy thêm địa danh mà bạn mong muốn thêm vào danh sách !</p>
            <form class="forms-sample" method="POST" action="{{route('diadanh.store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="exampleInputName1">Tên địa danh</label>
                    <input name="tendiadanh" type="text" class="form-control" id="exampleInputName1"
                        placeholder="Tên địa danh"> <br>
                    @if ($errors->has('tendiadanh'))
                    <small style="color:red">{{$errors->first('tendiadanh')}}</small> <br>
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
                    <label for="exampleInputName1">Kinh độ</label>
                    <input name="kinhdo" type="text" class="form-control" id="exampleInputName1"><br>
                    @if ($errors->has('kinhdo'))
                    <small style="color:red">{{$errors->first('kinhdo')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleInputName1">Vĩ độ</label>
                    <input name="vido" type="text" class="form-control" id="exampleInputName1"><br>
                    @if ($errors->has('vido'))
                    <small style="color:red">{{$errors->first('vido')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleSelectGender">Vùng miền</label>
                    <select class="form-control" name="vung_miens_id" id="exampleSelectGender">
                        <option value=" ">--chọn vùng miền--</option>
                        @foreach ($lstVungMien as $vungmien)
                        <option value="{{$vungmien->id}}">{{$vungmien->tenvungmien}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleSelectGender">Nhu Cầu</label>
                    <select class="form-control chosen-select" name="nhucau[]" id="exampleSelectGender" multiple>
                        <option value=" ">--chọn nhu cầu--</option>
                        @foreach ($lstnhucau as $nhucau)
                        <option value="{{$nhucau->id}}">{{$nhucau->tennhucau}}</option>
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