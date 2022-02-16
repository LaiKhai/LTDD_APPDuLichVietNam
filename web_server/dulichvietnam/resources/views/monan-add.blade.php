@extends('layouts.app')
@section('title')
Thêm món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">@yield('title')</h4>
            <form class="forms-sample" method="POST" action="{{route('monan.store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="exampleInputName1">Tên món ăn</label>
                    <input type="text" name="ten" class="form-control" id="exampleInputName1">
                    @if ($errors->has('ten'))
                    <small style="color:red">{{$errors->first('ten')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleTextarea1">Mô tả</label>
                    <textarea name="mota" class="form-control" id="exampleTextarea1" rows="10"></textarea>
                    @if ($errors->has('mota'))
                    <small style="color:red">{{$errors->first('mota')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label for="exampleSelectGender">Địa Danh</label>
                    <select class="form-control" id="exampleSelectGender" name="dia_danhs_id">
                        <option>--Địa Danh--</option>
                        @foreach ($lstdiaDanh as $diadanh)
                        <option value="{{$diadanh->id}}">{{$diadanh->tendiadanh}}</option>
                        @endforeach
                    </select>
                    @if ($errors->has('dia_danhs_id'))
                    <small style="color:red">{{$errors->first('dia_danhs_id')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <div class="input-group col-xs-12">
                        <input type="file" id="full_hinhanh" name="hinhanh" accept="image/*"
                            class="form-control file-upload-info" placeholder="Upload Image">
                    </div>
                    @if ($errors->has('hinhanh'))
                    <small style="color:red">{{$errors->first('hinhanh')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <img id="Hinh" src="{{asset('admin_view/assets/images/No_Image.png')}}" alt=""
                        style="width:300px; max-height:200px;object-fit:contain;">
                </div>
                <div class="form-check form-check-flat form-check-primary">
                    <label class="form-check-label" for="trangthai">
                        <input type="checkbox" class="form-check-input" name="trangthai" value=1>Trạng thái</label>
                </div>
                <button type="submit" class="btn btn-primary mr-2">Thêm</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('monan.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection
@section('Script')
<script>
    $('#full_hinhanh').change(function()
    {
    previewFile(this,'#Hinh');
    }
    );
    function previewFile(input, imgID) {
        var file = input.files[0];
        
        if (file) {
        var reader = new FileReader();
        
        reader.onload = function () {
        $(imgID).attr("src", reader.result);
        }
        
        reader.readAsDataURL(file);
        }
        }
</script>
@endsection