
{{- define "go-echodec836fd-2f79-4743-a047-e8a30801befa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodec836fd-2f79-4743-a047-e8a30801befa.fullname" -}}
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


{{- define "go-echodec836fd-2f79-4743-a047-e8a30801befa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodec836fd-2f79-4743-a047-e8a30801befa.labels" -}}
helm.sh/chart: {{ include "go-echodec836fd-2f79-4743-a047-e8a30801befa.chart" . }}
{{ include "go-echodec836fd-2f79-4743-a047-e8a30801befa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodec836fd-2f79-4743-a047-e8a30801befa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodec836fd-2f79-4743-a047-e8a30801befa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}