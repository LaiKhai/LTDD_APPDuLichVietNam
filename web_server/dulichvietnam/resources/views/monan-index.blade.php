@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin món ăn</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin món ăn</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Hình Ảnh </th>
                            <th class="text-center"> Tên món </th>
                            <th class="text-center"> Mô tả </th>
                            <th class="text-center"> Thuộc địa danh</th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($MonAn as $monan)
                        <tr>
                            <td class="text-center">{{$monan->id}}</td>
                            <td class="py-1">
                                <img src="{{$monan->hinhanh}}" alt="image"
                                    style="width:50px; max-height:200px;object-fit:contain;" />
                            </td>
                            <td class="text-center">{{$monan->ten}}</td>
                            <td>
                                <div style="width: 300px;
                                    white-space: normal;">{{$monan->mota}}</div>
                            </td>
                            <td class="text-center">@foreach ($diaDanh as $item)
                                {{$item->tendiadanh}}
                                @endforeach</td>
                            <td class="text-center">
                                @if ($monan->trangthai==1)
                                <span class="badge bg-success">Tồn tại</span>
                                @endif
                                @if ($monan->trangthai==0)
                                <span class="badge bg-danger">Đã xóa</span>
                                @endif
                                @if ($monan->trangthai==2)
                                <span class="badge bg-warining">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('monan.show',['monan'=>$monan])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('monan.edit',['monan'=>$monan])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('monan.destroy',['monan'=>$monan])}}">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection