
{{- define "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.fullname" -}}
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


{{- define "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.labels" -}}
helm.sh/chart: {{ include "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.chart" . }}
{{ include "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo22b1932f-728d-4b53-856a-2f506d3a00ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}