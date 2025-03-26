
{{- define "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.fullname" -}}
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


{{- define "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.labels" -}}
helm.sh/chart: {{ include "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.chart" . }}
{{ include "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe93da8df-96f7-4b41-92c5-f1d41077870b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}