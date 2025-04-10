
{{- define "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.fullname" -}}
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


{{- define "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.labels" -}}
helm.sh/chart: {{ include "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.chart" . }}
{{ include "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2948f50a-131e-46b3-9412-88d02a9369cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}