
{{- define "go-echob303e976-df79-43e2-9efe-7979913b7c0e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob303e976-df79-43e2-9efe-7979913b7c0e.fullname" -}}
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


{{- define "go-echob303e976-df79-43e2-9efe-7979913b7c0e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob303e976-df79-43e2-9efe-7979913b7c0e.labels" -}}
helm.sh/chart: {{ include "go-echob303e976-df79-43e2-9efe-7979913b7c0e.chart" . }}
{{ include "go-echob303e976-df79-43e2-9efe-7979913b7c0e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob303e976-df79-43e2-9efe-7979913b7c0e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob303e976-df79-43e2-9efe-7979913b7c0e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}