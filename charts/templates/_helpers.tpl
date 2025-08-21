
{{- define "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.fullname" -}}
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


{{- define "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.labels" -}}
helm.sh/chart: {{ include "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.chart" . }}
{{ include "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f6fb56d-b2d1-47df-8ce2-3329d98e41eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}