
{{- define "go-echoeebab8f8-f3f6-4648-b574-5059746af754.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebab8f8-f3f6-4648-b574-5059746af754.fullname" -}}
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


{{- define "go-echoeebab8f8-f3f6-4648-b574-5059746af754.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebab8f8-f3f6-4648-b574-5059746af754.labels" -}}
helm.sh/chart: {{ include "go-echoeebab8f8-f3f6-4648-b574-5059746af754.chart" . }}
{{ include "go-echoeebab8f8-f3f6-4648-b574-5059746af754.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeebab8f8-f3f6-4648-b574-5059746af754.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeebab8f8-f3f6-4648-b574-5059746af754.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}