
{{- define "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.fullname" -}}
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


{{- define "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.labels" -}}
helm.sh/chart: {{ include "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.chart" . }}
{{ include "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3166e02-f3d8-4574-b110-07f2d5f1af4b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}