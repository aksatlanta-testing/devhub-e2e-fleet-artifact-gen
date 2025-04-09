
{{- define "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.fullname" -}}
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


{{- define "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.labels" -}}
helm.sh/chart: {{ include "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.chart" . }}
{{ include "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3637a2a-673e-4d69-b2fe-043821c8c622.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}