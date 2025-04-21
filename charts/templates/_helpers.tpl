
{{- define "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.fullname" -}}
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


{{- define "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.labels" -}}
helm.sh/chart: {{ include "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.chart" . }}
{{ include "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo907881c3-465a-41f3-895e-b90f8d14d77f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}