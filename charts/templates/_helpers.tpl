
{{- define "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.fullname" -}}
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


{{- define "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.labels" -}}
helm.sh/chart: {{ include "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.chart" . }}
{{ include "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo868722fa-5073-4d22-ab8f-815d08b8c95f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}