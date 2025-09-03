
{{- define "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.fullname" -}}
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


{{- define "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.labels" -}}
helm.sh/chart: {{ include "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.chart" . }}
{{ include "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76e49fb2-815a-40a4-b5be-692515f3bbef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}