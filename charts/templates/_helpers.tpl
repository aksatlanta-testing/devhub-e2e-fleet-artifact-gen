
{{- define "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.fullname" -}}
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


{{- define "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.labels" -}}
helm.sh/chart: {{ include "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.chart" . }}
{{ include "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo55ec1ca0-b020-4d6d-bc73-83c92157acdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}