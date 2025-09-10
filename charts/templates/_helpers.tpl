
{{- define "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.labels" -}}
helm.sh/chart: {{ include "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.chart" . }}
{{ include "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa019c074-9e86-42ca-a41f-adb15c7608ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}