
{{- define "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.fullname" -}}
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


{{- define "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.labels" -}}
helm.sh/chart: {{ include "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.chart" . }}
{{ include "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d11b4fc-ac9b-4a74-8a8a-9d67789876bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}