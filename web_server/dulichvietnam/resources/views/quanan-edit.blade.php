@extends('layouts.app')
@section('title')
Chỉnh sửa thông tin quán ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">@yield('title')</h4>
            <form class="forms-sample" method="post" action="{{route('quanan.update',['quanan'=>$quanan])}}"
                enctype="multipart/form-data">
                @csrf
                @method('PATCH')
                <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="id" id="exampleInputUsername2"
                            value="{{$quanan->id}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên nơi lưu trú</label>
                    <div class="col-sm-9">
                        <input type="text" name="ten" class="form-control" id="exampleInputEmail2"
                            value="{{$quanan->ten}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">SĐT</label>
                    <div class="col-sm-9">
                        <input type="text" name="sdt" class="form-control" id="exampleInputEmail2"
                            value="{{$quanan->sdt}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Địa chỉ</label>
                    <div class="col-sm-9">
                        <textarea row="10" cols="40" class="form-control" id="exampleInputMobile"
                            name="diachi">{{$quanan->diachi}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Thuộc địa danh</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="exampleSelectGender" name="dia_danhs_id">
                            {{-- <option>---
                                @foreach ($diaDanh as $item)
                                {{$item->tendiadanh}}
                                @endforeach
                                ---</option> --}}
                            @foreach ($lstdiadanh as $diadanh)
                            <option value="{{$diadanh->id}}">{{$diadanh->tendiadanh}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Hình ảnh</label>
                    <div class="col-sm-9">
                        <img id="Hinh" src="{{$quanan->hinhanh}}"
                            style="width:200px; max-height:200px;object-fit:contain;" alt="">
                        <p></p>
                        <input id="full_hinhanh" type="file" name="hinhanh" accept="image/*"
                            class="form-control file-upload-info" placeholder="Upload Image">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng Thái</label>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="1"
                            {{$quanan->trangthai=='1'?'checked':''}}> <span class="badge bg-success text-white">Tồn
                            tại</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="2"
                            {{$quanan->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-warning text-white text-white"> Chờ duyệt</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="3"
                            {{$quanan->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-danger text-white text-white">Đã duyệt</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-success mr-2">Sửa</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('quanan.index')}}">Quay lại</a>
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