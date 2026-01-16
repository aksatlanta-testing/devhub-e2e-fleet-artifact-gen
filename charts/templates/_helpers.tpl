
{{- define "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.fullname" -}}
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


{{- define "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.labels" -}}
helm.sh/chart: {{ include "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.chart" . }}
{{ include "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc520a223-a52b-4a9f-b7ad-908794aa943c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}