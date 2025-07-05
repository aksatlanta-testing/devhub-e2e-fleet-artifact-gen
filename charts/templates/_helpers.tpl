
{{- define "go-echo59187984-1e8a-444f-8531-e5afc4987b25.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59187984-1e8a-444f-8531-e5afc4987b25.fullname" -}}
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


{{- define "go-echo59187984-1e8a-444f-8531-e5afc4987b25.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59187984-1e8a-444f-8531-e5afc4987b25.labels" -}}
helm.sh/chart: {{ include "go-echo59187984-1e8a-444f-8531-e5afc4987b25.chart" . }}
{{ include "go-echo59187984-1e8a-444f-8531-e5afc4987b25.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo59187984-1e8a-444f-8531-e5afc4987b25.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo59187984-1e8a-444f-8531-e5afc4987b25.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}